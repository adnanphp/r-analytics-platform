
# 📊 R Analytics Platform — Customer Churn Prediction

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R](https://img.shields.io/badge/R-4.3.1-blue.svg)](https://www.r-project.org/)
[![Shiny](https://img.shields.io/badge/Shiny-1.8.0-green.svg)](https://shiny.posit.co/)
[![Docker](https://img.shields.io/badge/Docker-Enabled-blue.svg)](https://www.docker.com/)

> An end-to-end customer churn analytics platform built with R, Spark, Shiny, SQL, and machine learning.

---

## 📋 Table of Contents

* [Overview](#-overview)
* [Features](#-features)
* [Technology Stack](#-technology-stack)
* [Architecture](#-architecture)
* [Project Structure](#-project-structure)
* [Getting Started](#-getting-started)
* [R Package Installation](#-r-package-installation)
* [Data Processing](#-data-processing)
* [Exploratory Data Analysis](#-exploratory-data-analysis)
* [Feature Engineering](#-feature-engineering)
* [Machine Learning](#-machine-learning)
* [Shiny Dashboard](#-shiny-dashboard)
* [Reports](#-reports)
* [Docker Deployment](#-docker-deployment)
* [Results](#-results)
* [Troubleshooting](#-troubleshooting)
* [Contributing](#-contributing)
* [License](#-license)
* [Acknowledgments](#-acknowledgments)

---

## 🎯 Overview

The **R Analytics Platform** is an end-to-end customer churn prediction system demonstrating a complete data science and machine learning workflow.

The platform covers:

1. Data ingestion and processing
2. Large-scale data processing with R and Spark
3. Exploratory data analysis
4. Feature engineering
5. Machine learning model development
6. Model evaluation
7. Interactive visualization with Shiny
8. Automated analytical reporting
9. SQL-based data extraction and feature creation
10. Docker-based deployment

The project is designed to demonstrate how an analytics workflow can move from **raw customer data → processed data → engineered features → machine learning → interactive dashboard → analytical reports**.

---

## ✨ Features

### 📊 Data Processing

* Raw customer data ingestion
* Data cleaning and transformation
* Missing-value handling
* Data validation
* Processed dataset generation
* Feature engineering pipeline
* R and Spark integration

### 🔎 Exploratory Data Analysis

* Customer churn analysis
* Churn distribution
* Demographic analysis
* Revenue analysis
* Customer engagement analysis
* Correlation analysis
* Interactive Plotly visualizations
* Statistical summaries

### 🤖 Machine Learning

The platform supports multiple classification models:

* Random Forest
* XGBoost
* Logistic Regression
* Regularized regression with GLMNET
* Additional models through `tidymodels`

Model evaluation includes:

* Accuracy
* Precision
* Recall
* F1 Score
* ROC AUC
* Confusion matrix
* Feature importance

### 📈 Interactive Shiny Dashboard

The Shiny application provides:

* Customer overview
* Churn statistics
* Interactive charts
* Customer segmentation
* Model performance visualization
* Feature importance
* Churn-risk prediction
* Data exploration

### 📑 Reproducible Reports

Analytical reports are generated using:

* Quarto
* R Markdown
* Knitr

Reports include:

* Exploratory analysis
* Modeling results
* Executive summary

### 🐳 Containerization

The application can be containerized with Docker for reproducible deployment.

---

## 🛠️ Technology Stack

| Category               | Technologies                               |
| ---------------------- | ------------------------------------------ |
| Programming            | R                                          |
| Data Manipulation      | tidyverse, dplyr                           |
| Distributed Processing | Apache Spark, sparklyr                     |
| Database               | PostgreSQL, DBI                            |
| Visualization          | ggplot2, Plotly, viridis                   |
| Machine Learning       | tidymodels, Random Forest, XGBoost, GLMNET |
| Dashboard              | Shiny, shinydashboard, bslib               |
| Reporting              | Quarto, R Markdown, Knitr                  |
| SQL                    | PostgreSQL / SQL                           |
| Containerization       | Docker, Docker Compose                     |
| Version Control        | Git, GitHub                                |

---

## 🏗️ Architecture

```text
                         ┌─────────────────────┐
                         │     DATA SOURCES    │
                         │                     │
                         │ CSV / Parquet / SQL │
                         └──────────┬──────────┘
                                    │
                                    ▼
                    ┌─────────────────────────────┐
                    │      DATA PROCESSING        │
                    │                             │
                    │ R + tidyverse + sparklyr    │
                    │ Data cleaning & validation   │
                    └──────────────┬──────────────┘
                                   │
                                   ▼
                    ┌─────────────────────────────┐
                    │     FEATURE ENGINEERING     │
                    │                             │
                    │ Customer behavior            │
                    │ Engagement metrics           │
                    │ Usage metrics                │
                    └──────────────┬──────────────┘
                                   │
                                   ▼
                    ┌─────────────────────────────┐
                    │      MACHINE LEARNING       │
                    │                             │
                    │ Random Forest               │
                    │ XGBoost                     │
                    │ Logistic Regression         │
                    │ tidymodels                  │
                    └──────────────┬──────────────┘
                                   │
                     ┌─────────────┴─────────────┐
                     │                           │
                     ▼                           ▼
          ┌─────────────────────┐     ┌─────────────────────┐
          │   SHINY DASHBOARD   │     │       REPORTS       │
          │                     │     │                     │
          │ Interactive         │     │ Quarto / R Markdown │
          │ visualizations      │     │ EDA / Modeling      │
          │ predictions         │     │ Executive Summary   │
          └─────────────────────┘     └─────────────────────┘
```

---

## 📁 Project Structure

```text
r-analytics-platform/
│
├── data/
│   ├── raw/
│   │   └── # Raw customer data
│   │
│   ├── processed/
│   │   └── # Cleaned and transformed datasets
│   │
│   └── features/
│       └── # Feature-engineered datasets
│
├── r/
│   ├── 01_data_processing.R
│   ├── 02_exploratory_analysis.R
│   ├── 03_feature_engineering.R
│   ├── 04_modeling.R
│   └── 05_evaluation.R
│
├── shiny/
│   ├── app.R
│   │
│   ├── www/
│   │   └── styles.css
│   │
│   └── modules/
│       └── # Shiny modules
│
├── reports/
│   ├── exploratory_report.qmd
│   ├── modeling_report.qmd
│   └── executive_summary.qmd
│
├── sql/
│   ├── data_extraction.sql
│   └── feature_creation.sql
│
├── docker/
│   ├── Dockerfile
│   └── docker-compose.yml
│
├── requirements.R
├── README.md
└── .gitignore
```

Generated datasets, plots, trained models, and other large artifacts can be excluded from Git using `.gitignore` and generated as part of the pipeline.

---

# 🚀 Getting Started

## Prerequisites

Install the following software:

* R 4.3.1 or later
* Git
* Docker (optional)
* Docker Compose (optional)
* Apache Spark (required if using the Spark pipeline)
* Quarto (required for Quarto reports)

RStudio is recommended but not required.

---

## 📥 Clone the Repository

```bash
git clone https://github.com/adnanphp/r-analytics-platform.git
cd r-analytics-platform
```

---

# 📦 R Package Installation

The project uses a collection of R packages for data processing, visualization, machine learning, reporting, and Shiny.

You can install the required packages with:

```bash
Rscript -e "install.packages(c(
  'tidyverse',
  'sparklyr',
  'DBI',
  'RPostgreSQL',
  'ggplot2',
  'plotly',
  'DT',
  'viridis',
  'tidymodels',
  'randomForest',
  'xgboost',
  'ranger',
  'glmnet',
  'survival',
  'lubridate',
  'shiny',
  'shinydashboard',
  'shinyWidgets',
  'shinythemes',
  'bslib',
  'rmarkdown',
  'knitr',
  'here',
  'glue',
  'logger',
  'furrr',
  'patchwork',
  'themis',
  'yardstick'
))"
```

Or use the project's package installation file:

```bash
Rscript requirements.R
```

---

# 🔄 Data Processing

Run the data-processing pipeline:

```bash
Rscript r/01_data_processing.R
```

This stage is responsible for:

* Loading raw customer data
* Cleaning the dataset
* Handling missing values
* Validating data
* Transforming variables
* Saving processed datasets

Processed data is stored under:

```text
data/processed/
```

---

# 🔎 Exploratory Data Analysis

Run:

```bash
Rscript r/02_exploratory_analysis.R
```

The EDA pipeline analyzes:

* Customer demographics
* Customer activity
* Revenue
* Usage patterns
* Engagement
* Churn distribution
* Relationships between customer attributes

Visualizations are generated using `ggplot2` and `plotly`.

---

# ⚙️ Feature Engineering

Run:

```bash
Rscript r/03_feature_engineering.R
```

This stage creates predictive features such as:

* Customer engagement
* Usage intensity
* Total usage
* Satisfaction indicators
* Customer lifetime characteristics
* Time-based behavioral features

Engineered features are stored under:

```text
data/features/
```

---

# 🤖 Machine Learning

Run:

```bash
Rscript r/04_modeling.R
```

The modeling pipeline uses `tidymodels` and supports multiple algorithms.

### Models

* Random Forest
* XGBoost
* Logistic Regression
* GLMNET

The workflow includes:

```text
Data
  ↓
Train/Test Split
  ↓
Preprocessing
  ↓
Feature Engineering
  ↓
Model Training
  ↓
Hyperparameter Tuning
  ↓
Prediction
  ↓
Model Evaluation
```

---

# 📊 Model Evaluation

Run:

```bash
Rscript r/05_evaluation.R
```

Evaluation includes:

* Accuracy
* Precision
* Recall
* F1 Score
* ROC AUC
* Confusion matrix
* ROC curves
* Feature importance

---

# 📈 Shiny Dashboard

Start the dashboard with:

```bash
R -e "shiny::runApp('shiny/app.R', port = 3838, host = '0.0.0.0')"
```

Then open:

```text
http://localhost:3838
```

### Dashboard Sections

#### Overview

Displays:

* Total customers
* Churn rate
* Average revenue
* Customer statistics

#### Exploratory Analysis

Interactive visualizations for:

* Churn
* Revenue
* Customer demographics
* Engagement
* Usage

#### Model Performance

Displays:

* Model metrics
* Confusion matrices
* ROC curves
* Feature importance

#### Predictions

Allows users to evaluate churn risk for customer profiles.

---

# 📑 Reports

The project uses Quarto for reproducible analytical reporting.

Example:

```bash
quarto render reports/exploratory_report.qmd
```

Modeling report:

```bash
quarto render reports/modeling_report.qmd
```

Executive summary:

```bash
quarto render reports/executive_summary.qmd
```

Reports provide a reproducible record of:

* Data analysis
* Statistical findings
* Model performance
* Business insights
* Recommendations

---

# 🐳 Docker Deployment

## Build the Docker Image

From the project root:

```bash
docker build -t r-analytics:latest -f docker/Dockerfile .
```

## Run the Container

```bash
docker run -p 3838:3838 r-analytics:latest
```

Access the dashboard:

```text
http://localhost:3838
```

---

## Docker Compose

Start the services:

```bash
docker compose -f docker/docker-compose.yml up -d
```

Check running containers:

```bash
docker compose -f docker/docker-compose.yml ps
```

View logs:

```bash
docker compose -f docker/docker-compose.yml logs -f
```

Stop the services:

```bash
docker compose -f docker/docker-compose.yml down
```

---

# 📊 Results

> **Note:** Replace the following values with the actual results produced by your final model evaluation before publishing the README.

## Model Performance

| Model               | Accuracy | ROC AUC | Precision | Recall |
| ------------------- | -------: | ------: | --------: | -----: |
| Random Forest       |    98.7% |   0.997 |     98.5% |  98.5% |
| XGBoost             |    98.5% |   0.995 |     98.3% |  98.4% |
| Logistic Regression |    97.8% |   0.991 |     97.6% |  97.5% |

## Feature Importance

Example top predictive features:

| Feature                   | Importance |
| ------------------------- | ---------: |
| `days_since_registration` |      43.2% |
| `engagement_score`        |      28.5% |
| `usage_intensity`         |       8.5% |
| `total_usage`             |       2.2% |
| `satisfaction_score`      |       1.9% |

These values should be updated from the actual model output if the final implementation produces different results.

---

# 📈 Key Analytics

The platform is designed to answer questions such as:

* Which customers are most likely to churn?
* Which customer characteristics are associated with churn?
* Does customer engagement affect churn probability?
* How does revenue differ between churned and retained customers?
* Which features contribute most to churn predictions?
* Which machine learning model provides the best predictive performance?

---

# 🔧 Troubleshooting

## R Package Installation Problems

Install a missing package manually:

```bash
Rscript -e "install.packages('PACKAGE_NAME', repos='https://cloud.r-project.org')"
```

For example:

```bash
Rscript -e "install.packages('dplyr', repos='https://cloud.r-project.org')"
```

---

## Shiny Application Does Not Start

Check your current directory:

```bash
pwd
```

Navigate to the project root:

```bash
cd /path/to/r-analytics-platform
```

Then run:

```bash
R -e "shiny::runApp('shiny/app.R', port = 3838, host = '0.0.0.0')"
```

---

## Docker Build Problems

Rebuild without using the Docker cache:

```bash
docker build --no-cache \
  -t r-analytics:latest \
  -f docker/Dockerfile .
```

Check Docker:

```bash
docker --version
```

Check running containers:

```bash
docker ps
```

---

## Spark Problems

Check whether PySpark is installed:

```bash
python3 -c "import pyspark; print(pyspark.__version__)"
```

Check Spark from the command line:

```bash
spark-submit --version
```

For the R/Spark integration, verify that `sparklyr` is installed:

```bash
R -e "packageVersion('sparklyr')"
```

---

# 🚀 One-Command Workflow

You can automate the main analytics pipeline with a shell script such as `run_all.sh`:

```bash
#!/bin/bash

set -e

echo "🚀 Starting R Analytics Platform"
echo "================================"

echo "📊 Step 1: Data Processing"
Rscript r/01_data_processing.R

echo "🔎 Step 2: Exploratory Analysis"
Rscript r/02_exploratory_analysis.R

echo "⚙️ Step 3: Feature Engineering"
Rscript r/03_feature_engineering.R

echo "🤖 Step 4: Model Training"
Rscript r/04_modeling.R

echo "📈 Step 5: Model Evaluation"
Rscript r/05_evaluation.R

echo "✅ Analytics pipeline completed successfully!"
```

Make it executable:

```bash
chmod +x run_all.sh
```

Run:

```bash
./run_all.sh
```

---

# 🔐 Configuration

Database credentials and other environment-specific settings should **not** be hard-coded into the source code.

Use environment variables instead.

Example:

```bash
export DB_HOST="localhost"
export DB_PORT="5432"
export DB_NAME="analytics"
export DB_USER="your_user"
export DB_PASSWORD="your_password"
```

Do not commit `.env` files containing passwords or API keys.

Add them to `.gitignore`:

```text
.env
.Rhistory
.RData
.Rproj.user/
```

---

# 🧪 Reproducibility

The project separates the analytics workflow into independent stages:

```text
01_data_processing.R
        ↓
02_exploratory_analysis.R
        ↓
03_feature_engineering.R
        ↓
04_modeling.R
        ↓
05_evaluation.R
```

This structure makes the project easier to:

* Reproduce
* Debug
* Extend
* Test
* Deploy

---

# 🤝 Contributing

Contributions are welcome.

### 1. Fork the repository

```bash
git clone https://github.com/adnanphp/r-analytics-platform.git
```

### 2. Create a feature branch

```bash
git checkout -b feature/new-feature
```

### 3. Commit your changes

```bash
git add .
git commit -m "Add new feature"
```

### 4. Push the branch

```bash
git push origin feature/new-feature
```

### 5. Open a Pull Request

---

# 📜 License

This project is licensed under the **MIT License**.

See the `LICENSE` file for details.

---

# 🙏 Acknowledgments

This project uses the following open-source technologies:

* **R** — Statistical computing and data science
* **tidyverse** — Data manipulation and analysis
* **sparklyr** — R interface to Apache Spark
* **ggplot2** — Data visualization
* **Plotly** — Interactive visualization
* **tidymodels** — Machine learning framework
* **Shiny** — Interactive web applications
* **Quarto** — Reproducible publishing
* **Docker** — Containerization
* **PostgreSQL** — Relational database

---

# 👤 Author

**Adnan**

GitHub: [@adnanphp](https://github.com/adnanphp)

---

## ⭐ Project

If you find this project useful, consider giving it a ⭐ on GitHub.

---

> Built with R, Shiny, Spark, SQL, and machine learning.
