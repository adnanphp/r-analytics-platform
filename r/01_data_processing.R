# 01_data_processing.R
# Data processing using PySpark (already installed)

library(sparklyr)
library(tidyverse)
library(lubridate)
library(logger)

# Initialize logging
log_threshold(INFO)

# ============================
# 1. Configure Spark to use PySpark
# ============================

log_info("Setting up Spark with PySpark...")

# Set SPARK_HOME to PySpark location
# Find PySpark location
pyspark_path <- system("python -c 'import pyspark; import os; print(os.path.dirname(pyspark.__file__))'", 
                       intern = TRUE)
Sys.setenv(SPARK_HOME = pyspark_path)

log_info(paste("SPARK_HOME set to:", pyspark_path))

# ============================
# 2. Connect to Spark
# ============================

log_info("Connecting to Spark...")

# Try connecting with PySpark
sc <- tryCatch({
  spark_connect(
    master = "local[*]",
    method = "shell",
    spark_home = pyspark_path,
    config = list(
      spark.executor.memory = "4g",
      spark.driver.memory = "4g",
      spark.sql.adaptive.enabled = "true"
    )
  )
}, error = function(e) {
  log_warn(paste("Shell connection failed:", e$message))
  log_info("Trying alternative connection method...")
  
  # Alternative: Use sparklyr's default
  spark_connect(
    master = "local[*]",
    config = list(
      spark.executor.memory = "4g",
      spark.driver.memory = "4g"
    )
  )
})

log_info("Spark connected successfully!")

# ============================
# 3. Generate or Load Data
# ============================

log_info("Generating customer data...")

set.seed(42)
n_customers <- 50000  # 50k records

# Create sample data
customer_data <- tibble(
  customer_id = 1:n_customers,
  
  # Demographics
  age = round(rnorm(n_customers, mean = 40, sd = 15), 0),
  gender = sample(c("M", "F"), n_customers, replace = TRUE),
  region = sample(c("North", "South", "East", "West"), 
                  n_customers, replace = TRUE, 
                  prob = c(0.3, 0.25, 0.25, 0.2)),
  
  # Account info
  plan_type = sample(c("Basic", "Premium", "Enterprise"), 
                     n_customers, replace = TRUE,
                     prob = c(0.5, 0.35, 0.15)),
  registration_date = sample(
    seq(as.Date("2020-01-01"), as.Date("2023-12-31"), by = "day"),
    n_customers, replace = TRUE
  ),
  
  # Usage metrics
  total_usage = round(rgamma(n_customers, shape = 2, scale = 100), 0),
  login_count = round(rpois(n_customers, lambda = 20), 0),
  transaction_count = round(rpois(n_customers, lambda = 10), 0),
  
  # Revenue
  total_revenue = round(rlnorm(n_customers, meanlog = 6, sdlog = 1.5), 2),
  
  # Activity
  last_activity_date = sample(
    seq(as.Date("2023-01-01"), as.Date("2024-12-31"), by = "day"),
    n_customers, replace = TRUE
  ),
  
  # Marketing
  marketing_channel = sample(
    c("Email", "Social Media", "Referral", "Paid Ads", "Organic"),
    n_customers, replace = TRUE
  ),
  
  device_type = sample(
    c("Mobile", "Desktop", "Tablet"),
    n_customers, replace = TRUE
  ),
  
  satisfaction_score = round(rnorm(n_customers, mean = 4, sd = 1), 1),
  support_tickets = round(rpois(n_customers, lambda = 2), 0)
)

# ============================
# 4. Load to Spark
# ============================

log_info("Loading data to Spark...")

spark_data <- copy_to(sc, customer_data, name = "customer_data", overwrite = TRUE)

# ============================
# 5. Process with Spark
# ============================

log_info("Processing data with Spark...")

processed_spark <- spark_data %>%
  mutate(
    # Date processing
    registration_date = as.Date(registration_date),
    last_activity_date = as.Date(last_activity_date),
    days_since_registration = datediff(current_date(), registration_date),
    days_since_activity = datediff(current_date(), last_activity_date),
    month = month(registration_date),
    year = year(registration_date),
    quarter = quarter(registration_date)
  ) %>%
  mutate(
    # Derived features
    usage_intensity = total_usage / (days_since_registration + 1),
    engagement_score = (login_count + transaction_count) / (days_since_registration + 1),
    
    # Churn flag (target)
    churned = case_when(
      days_since_activity > 90 ~ 1,
      TRUE ~ 0
    )
  )

# ============================
# 6. Collect Results
# ============================

log_info("Collecting results...")

processed_data <- processed_spark %>%
  collect() %>%
  mutate(
    plan_type = as.factor(plan_type),
    region = as.factor(region),
    device_type = as.factor(device_type),
    marketing_channel = as.factor(marketing_channel),
    gender = as.factor(gender),
    age_group = case_when(
      age < 25 ~ "18-24",
      age < 35 ~ "25-34",
      age < 45 ~ "35-44",
      age < 55 ~ "45-54",
      TRUE ~ "55+"
    )
  )

# ============================
# 7. Save Data
# ============================

log_info("Saving processed data...")

dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)

write_csv(processed_data, "data/processed/processed_data.csv")
saveRDS(processed_data, "data/processed/processed_data.rds")

log_info(paste("Total customers:", nrow(processed_data)))
log_info(paste("Churn rate:", round(mean(processed_data$churned) * 100, 1), "%"))

# ============================
# 8. Disconnect Spark
# ============================

spark_disconnect(sc)

log_info("Data processing complete!")
