# 📊 R Analytics Platform: Customer Churn Prediction

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R Version](https://img.shields.io/badge/R-4.3.1-blue.svg)](https://www.r-project.org/)
[![Shiny](https://img.shields.io/badge/Shiny-1.8.0-green.svg)](https://shiny.rstudio.com/)
[![Docker](https://img.shields.io/badge/Docker-✓-blue.svg)](https://www.docker.com/)

> Production-ready customer churn analytics platform with R, Shiny, and Machine Learning

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Quick Start](#quick-start)
- [Project Structure](#project-structure)
- [API & Usage](#api--usage)
- [Docker Deployment](#docker-deployment)
- [Results](#results)
- [Contributing](#contributing)

## 🎯 Overview

This project demonstrates a complete end-to-end data science workflow:

1. **Large-scale data processing** with R and Spark
2. **Exploratory data analysis** with ggplot2 and plotly
3. **Machine learning** with tidymodels (Random Forest, XGBoost, GLM)
4. **Interactive dashboards** with Shiny
5. **Reproducible reporting** with Quarto/R Markdown
6. **Containerized deployment** with Docker

## ✨ Features

- ✅ **50,000+ records** processed with R/Spark
- ✅ **Interactive Shiny dashboard** with real-time visualizations
- ✅ **Predictive modeling** with 98.7% accuracy
- ✅ **Feature importance** analysis
- ✅ **Customer segmentation** and risk profiling
- ✅ **Docker containerization** for reproducible deployment
- ✅ **Comprehensive EDA** with 10+ visualization types
- ✅ **Automated reporting** with R Markdown

## 🏗️ Architecture
┌─────────────────────────────────────────────────────────────┐
│ DATA SOURCES │
│ (CSV, Parquet, PostgreSQL) │
└─────────────────────────┬───────────────────────────────────┘
▼
┌─────────────────────────────────────────────────────────────┐
│ Spark / R (Data Processing) │
│ - sparklyr for distributed computing │
│ - tidyverse for data manipulation │
└─────────────────────────┬───────────────────────────────────┘
▼
┌─────────────────────────────────────────────────────────────┐
│ R (Core Analytics) │
│ ┌─────────────────────────────────────────────────────┐ │
│ │ tidyverse (Data Manipulation) │ │
│ └─────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────┐ │
│ │ ggplot2 + plotly (Visualization) │ │
│ └─────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────┐ │
│ │ tidymodels (Machine Learning) │ │
│ │ - Random Forest, XGBoost, GLM │ │
│ └─────────────────────────────────────────────────────┘ │
└─────────────────────────┬───────────────────────────────────┘
▼
┌─────────────────────────────────────────────────────────────┐
│ Shiny (Interactive) │
│ - Real-time dashboards │
│ - Customer segmentation │
│ - Risk prediction │
└─────────────────────────┬───────────────────────────────────┘
▼
┌─────────────────────────────────────────────────────────────┐
│ Quarto / R Markdown (Reports) │
│ - Automated HTML/PDF reports │
│ - Executive summaries │
└─────────────────────────────────────────────────────────────┘

text

## 🚀 Quick Start

### Prerequisites

- R 4.3.1+
- RStudio (recommended) or any R IDE
- Docker (optional, for containerized deployment)

### Local Installation

```bash
# 1. Clone the repository
git clone https://github.com/adnanphp/r-analytics-platform.git
cd r-analytics-platform

# 2. Install R packages
Rscript -e "install.packages(c('tidyverse', 'shiny', 'shinydashboard', 'shinyWidgets', 'ggplot2', 'plotly', 'DT', 'viridis', 'tidymodels', 'ranger', 'xgboost', 'glmnet', 'lubridate', 'sparklyr', 'DBI', 'RPostgreSQL'))"

# 3. Generate sample data
python3 data_processing.py
# OR
Rscript r/01_data_processing.R

# 4. Run exploratory analysis
Rscript r/02_exploratory_analysis.R

# 5. Run feature engineering
Rscript r/03_feature_engineering.R

# 6. Train models
Rscript r/04_modeling.R

# 7. Launch Shiny dashboard
R -e "shiny::runApp('shiny/app.R', port = 3838, host = '0.0.0.0')"

# 8. Open browser at: http://localhost:3838
One-Command Setup
bash
# Run everything with one command
chmod +x run_all.sh
./run_all.sh
Create run_all.sh:

bash
#!/bin/bash
echo "🚀 Running R Analytics Platform"
echo "================================"

python3 data_processing.py
Rscript r/02_exploratory_analysis.R
Rscript r/03_feature_engineering.R
Rscript r/04_modeling.R

echo "✅ All tasks complete!"
echo "🌐 Starting Shiny app at http://localhost:3838"
R -e "shiny::runApp('shiny/app.R', port = 3838, host = '0.0.0.0')"
📁 Project Structure
text
r-analytics-platform/
├── data/
│   ├── processed/
│   │   ├── processed_data.csv
│   │   └── processed_data.pkl
│   └── features/
│       └── feature_engineering.rds
├── r/
│   ├── 01_data_processing.R
│   ├── 02_exploratory_analysis.R
│   ├── 03_feature_engineering.R
│   └── 04_modeling.R
├── shiny/
│   ├── app.R
│   ├── www/
│   │   └── styles.css
│   └── modules/
├── reports/
│   ├── executive_summary.Rmd
│   ├── churn_by_plan.csv
│   ├── churn_by_region.csv
│   └── overall_summary.csv
├── plots/
│   ├── plan_type_churn.png
│   ├── age_churn.png
│   ├── revenue_churn.png
│   └── ...
├── models/
│   └── model_results.rds
├── docker/
│   ├── Dockerfile
│   └── docker-compose.yml
├── data_processing.py
├── requirements.R
├── .gitignore
└── README.md
🐳 Docker Deployment
Build and Run with Docker
bash
# Build the image
docker build -t r-analytics:latest -f docker/Dockerfile .

# Run the container
docker run -p 3838:3838 r-analytics:latest

# Access at: http://localhost:3838
Docker Compose
bash
# Start all services
docker-compose -f docker/docker-compose.yml up -d

# Check status
docker-compose -f docker/docker-compose.yml ps

# View logs
docker-compose -f docker/docker-compose.yml logs -f

# Stop services
docker-compose -f docker/docker-compose.yml down
📊 Results
Model Performance
Model	Accuracy	ROC AUC	Precision	Recall
Random Forest	98.7%	0.997	98.5%	98.5%
XGBoost	98.5%	0.995	98.3%	98.4%
Logistic Regression	97.8%	0.991	97.6%	97.5%
Top Features
days_since_registration - 43.2%

engagement_score - 28.5%

usage_intensity - 8.5%

total_usage - 2.2%

satisfaction_score - 1.9%

📈 Shiny Dashboard
Features
Overview: Key metrics (total customers, churn rate, avg revenue)

Exploratory Analysis: Interactive plots and data exploration

Model Performance: View model metrics and confusion matrix

Predictions: Predict churn risk for new customers

Access
Dashboard: http://localhost:3838

Username: admin

Password: admin

🔧 Troubleshooting
R Package Issues
bash
# Install missing packages
Rscript -e "install.packages('package_name', repos='https://cloud.r-project.org')"
Docker Issues
bash
# Clean Docker cache
docker system prune -a

# Rebuild
docker build --no-cache -t r-analytics:latest -f docker/Dockerfile .
Shiny App Not Loading
bash
# Check working directory
R -e "getwd()"

# Run from correct directory
cd /path/to/r-analytics-platform
R -e "shiny::runApp('shiny/app.R', port = 3838)"
🤝 Contributing
Fork the repository

Create your feature branch (git checkout -b feature/amazing)

Commit your changes (git commit -m 'Add amazing feature')

Push to the branch (git push origin feature/amazing)

Open a Pull Request

📝 License
This project is licensed under the MIT License - see the LICENSE file for details.

 Acknowledgments
R - Statistical computing

Shiny - Interactive web applications

tidymodels - Machine learning

tidyverse - Data science

Docker - Containerization

 Contact
GitHub: @adnanphp

LinkedIn: adnanphy

Built with ❤️ using R and Shiny
