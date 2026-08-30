# requirements.R
# Install all required packages

packages <- c(
  # Data manipulation
  "tidyverse",
  "dplyr",
  "tidyr",
  "purrr",
  "stringr",
  "forcats",
  
  # Big Data
  "sparklyr",
  "DBI",
  "RPostgreSQL",
  
  # Visualization
  "ggplot2",
  "plotly",
  "DT",
  "viridis",
  
  # Machine Learning
  "tidymodels",
  "randomForest",
  "xgboost",
  "ranger",
  "glmnet",
  "survival",
  
  # Time Series
  "lubridate",
  "tsibble",
  "fable",
  
  # Shiny
  "shiny",
  "shinydashboard",
  "shinyWidgets",
  "shinythemes",
  "bslib",
  
  # Reports
  "quarto",
  "rmarkdown",
  "knitr",
  
  # Utilities
  "here",
  "glue",
  "logger",
  "furrr"
)

install.packages(packages)
