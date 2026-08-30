# r/03_feature_engineering.R
library(tidyverse)
library(tidymodels)
library(recipes)
library(themis)

# Load data
data <- read_csv("data/processed/processed_data.csv")

# Convert churned to factor
data <- data %>%
  mutate(churned = as.factor(churned))

# ============================
# Feature Engineering Pipeline (NO SMOTE)
# ============================

churn_recipe <- recipe(churned ~ ., data = data) %>%
  
  # Remove ID and date columns
  step_rm(customer_id, registration_date, last_activity_date) %>%
  
  # Handle missing values
  step_impute_mean(all_numeric_predictors()) %>%
  step_impute_mode(all_nominal_predictors()) %>%
  
  # Dummy variables
  step_dummy(all_nominal_predictors(), one_hot = FALSE) %>%
  
  # Normalize
  step_normalize(all_numeric_predictors()) %>%
  
  # Remove zero variance predictors
  step_nzv(all_predictors())

# ============================
# Prepare and Apply
# ============================

print("Feature engineering recipe created:")

prepped_recipe <- prep(churn_recipe, training = data)
processed_data <- bake(prepped_recipe, new_data = NULL)

# ============================
# Save Results
# ============================

dir.create("data/features", recursive = TRUE, showWarnings = FALSE)

feature_names <- processed_data %>%
  select(-churned) %>%
  names()

saveRDS(list(
  recipe = prepped_recipe,
  features = feature_names,
  processed_data = processed_data
), "data/features/feature_engineering.rds")

print("=")
print("🔧 FEATURE ENGINEERING COMPLETE!")
print("=")
print("")
print(paste("Original features:", ncol(data) - 1))
print(paste("Engineered features:", ncol(processed_data) - 1))
print(paste("Total samples:", nrow(processed_data)))
print("")
print("Feature engineering saved to: data/features/feature_engineering.rds")
print("=")
