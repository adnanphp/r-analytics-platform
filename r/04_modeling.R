# r/04_modeling.R
library(tidyverse)
library(tidymodels)
library(ranger)

set.seed(42)

# Check if file exists
if (!file.exists("data/features/feature_engineering.rds")) {
  stop("Error: feature_engineering.rds not found. Run 03_feature_engineering.R first.")
}

# Load data
fe <- readRDS("data/features/feature_engineering.rds")
data <- fe$processed_data

# Check churn distribution
print("Churn distribution:")
print(table(data$churned))
print(prop.table(table(data$churned)))

# ============================
# Train/Test Split
# ============================

data_split <- initial_split(data, prop = 0.8, strata = churned)
train_data <- training(data_split)
test_data <- testing(data_split)

# ============================
# Simple Random Forest
# ============================

# Create model
rf_model <- rand_forest(
  trees = 100,
  mtry = floor(sqrt(ncol(train_data) - 1)),
  min_n = 5
) %>%
  set_engine("ranger", importance = "impurity") %>%
  set_mode("classification")

# Create workflow
rf_workflow <- workflow() %>%
  add_model(rf_model) %>%
  add_formula(churned ~ .)

# Fit
print("Training Random Forest...")
rf_fit <- fit(rf_workflow, train_data)

# Predict
print("Making predictions...")
predictions <- predict(rf_fit, test_data, type = "prob") %>%
  bind_cols(predict(rf_fit, test_data, type = "class")) %>%
  bind_cols(test_data %>% select(churned))

# ============================
# Evaluate
# ============================

metrics_df <- predictions %>%
  metrics(truth = churned, estimate = .pred_class, .pred_1)

conf_matrix <- predictions %>%
  conf_mat(truth = churned, estimate = .pred_class)

roc_auc <- predictions %>%
  roc_auc(truth = churned, .pred_1)

print("=")
print("🤖 MODELING COMPLETE!")
print("=")
print("")
print("Metrics:")
print(metrics_df)
print("")
print("Confusion Matrix:")
print(conf_matrix)
print("")
print(paste("ROC AUC:", round(roc_auc$.estimate, 3)))

# ============================
# Feature Importance
# ============================

importance <- rf_fit %>%
  extract_fit_engine() %>%
  ranger::importance()

importance_df <- tibble(
  feature = names(importance),
  importance = as.numeric(importance)
) %>%
  arrange(desc(importance)) %>%
  head(10)

print("")
print("Top 10 Features:")
print(importance_df)

# ============================
# Save Models
# ============================

dir.create("models", showWarnings = FALSE)

saveRDS(list(
  model = rf_fit,
  metrics = metrics_df,
  confusion_matrix = conf_matrix,
  roc_auc = roc_auc,
  importance = importance_df,
  predictions = predictions
), "models/model_results.rds")

print("")
print("Models saved to: models/model_results.rds")
print("=")
