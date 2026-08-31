# shiny/app.R
# Interactive Shiny Dashboard

# ============================
# LOAD PACKAGES
# ============================

library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(tidyverse)
library(ggplot2)
library(plotly)
library(DT)
library(viridis)

# ============================
# SET CORRECT DATA PATH FOR RENDER
# ============================

# Get the directory where this script is running
app_dir <- getwd()

# On Render, data is in /srv/shiny-server/data/
# Locally, data is in ../data/ relative to shiny/ folder

# Try multiple possible paths
possible_paths <- c(
  file.path(app_dir, "data", "processed", "processed_data.csv"),
  file.path(app_dir, "..", "data", "processed", "processed_data.csv"),
  file.path("/srv", "shiny-server", "data", "processed", "processed_data.csv"),
  file.path("data", "processed", "processed_data.csv")
)

data_path <- NULL
for (path in possible_paths) {
  if (file.exists(path)) {
    data_path <- path
    break
  }
}

if (is.null(data_path)) {
  stop("Error: processed_data.csv not found in any expected location!")
}

message(paste("Loading data from:", data_path))

# ============================
# LOAD DATA
# ============================

data <- read_csv(data_path)

# Convert churned to factor
data <- data %>%
  mutate(
    churned_factor = as.factor(churned),
    churned_label = ifelse(churned == 1, "Churned", "Active")
  )

# Load models if available
models <- NULL
models_paths <- c(
  file.path(app_dir, "models", "model_results.rds"),
  file.path(app_dir, "..", "models", "model_results.rds"),
  file.path("/srv", "shiny-server", "models", "model_results.rds"),
  file.path("models", "model_results.rds")
)

for (path in models_paths) {
  if (file.exists(path)) {
    models <- readRDS(path)
    break
  }
}

# ============================
# UI
# ============================

ui <- dashboardPage(
  dashboardHeader(title = "Customer Churn Analytics Platform"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
      menuItem("Exploratory Analysis", tabName = "eda", icon = icon("chart-pie")),
      menuItem("Model Performance", tabName = "models", icon = icon("robot")),
      menuItem("Predictions", tabName = "predict", icon = icon("magic"))
    ),
    pickerInput("segment", "Segment:",
                choices = c("All", "Basic", "Premium", "Enterprise"),
                selected = "All")
  ),
  
  dashboardBody(
    tabItems(
      # Overview tab
      tabItem(tabName = "overview",
        fluidRow(
          valueBoxOutput("total_customers"),
          valueBoxOutput("churn_rate"),
          valueBoxOutput("avg_revenue")
        ),
        fluidRow(
          box(
            title = "Churn by Plan",
            plotlyOutput("plan_churn_plot", height = 300),
            width = 6
          ),
          box(
            title = "Churn by Region",
            plotlyOutput("region_churn_plot", height = 300),
            width = 6
          )
        )
      ),
      
      # EDA tab
      tabItem(tabName = "eda",
        fluidRow(
          box(
            title = "Age Distribution",
            plotlyOutput("age_plot", height = 350),
            width = 6
          ),
          box(
            title = "Revenue Distribution",
            plotlyOutput("revenue_plot", height = 350),
            width = 6
          )
        ),
        fluidRow(
          box(
            title = "Data Table",
            DTOutput("data_table"),
            width = 12
          )
        )
      ),
      
      # Model Performance tab
      tabItem(tabName = "models",
        fluidRow(
          box(
            title = "Model Metrics",
            verbatimTextOutput("model_metrics"),
            width = 6
          ),
          box(
            title = "Confusion Matrix",
            verbatimTextOutput("confusion_matrix"),
            width = 6
          )
        ),
        fluidRow(
          box(
            title = "Top Features",
            plotlyOutput("feature_importance", height = 400),
            width = 12
          )
        )
      ),
      
      # Predictions tab
      tabItem(tabName = "predict",
        fluidRow(
          box(
            title = "Predict Churn Risk",
            width = 6,
            numericInput("age", "Age:", value = 30, min = 18, max = 80),
            selectInput("plan", "Plan Type:", 
                        choices = c("Basic", "Premium", "Enterprise")),
            selectInput("region", "Region:",
                        choices = c("North", "South", "East", "West")),
            numericInput("usage", "Total Usage:", value = 500, min = 0),
            numericInput("revenue", "Total Revenue:", value = 1000, min = 0),
            numericInput("satisfaction", "Satisfaction Score:", value = 4, min = 1, max = 5),
            numericInput("tickets", "Support Tickets:", value = 2, min = 0, max = 10),
            actionButton("predict_btn", "Predict Churn Risk", 
                        class = "btn-primary btn-lg"),
            br(), br(),
            verbatimTextOutput("prediction_result")
          ),
          box(
            title = "Risk Factors",
            plotlyOutput("risk_factors", height = 400),
            width = 6
          )
        )
      )
    )
  )
)

# ============================
# SERVER
# ============================

server <- function(input, output, session) {
  
  # Reactive data
  filtered_data <- reactive({
    if (input$segment == "All") {
      data
    } else {
      data %>% filter(plan_type == input$segment)
    }
  })
  
  # Overview
  output$total_customers <- renderValueBox({
    valueBox(
      value = nrow(filtered_data()) %>% format(big.mark = ","),
      subtitle = "Total Customers",
      icon = icon("users"),
      color = "blue"
    )
  })
  
  output$churn_rate <- renderValueBox({
    churn_rate <- filtered_data() %>%
      summarise(rate = mean(churned) * 100) %>%
      pull(rate) %>%
      round(1)
    
    valueBox(
      value = paste0(churn_rate, "%"),
      subtitle = "Churn Rate",
      icon = icon("exclamation-triangle"),
      color = ifelse(churn_rate > 25, "red", "green")
    )
  })
  
  output$avg_revenue <- renderValueBox({
    avg_rev <- filtered_data() %>%
      summarise(revenue = mean(total_revenue, na.rm = TRUE)) %>%
      pull(revenue) %>%
      round(2) %>%
      format(big.mark = ",")
    
    valueBox(
      value = paste0("$", avg_rev),
      subtitle = "Average Revenue",
      icon = icon("dollar-sign"),
      color = "yellow"
    )
  })
  
  # Plots
  output$plan_churn_plot <- renderPlotly({
    p <- filtered_data() %>%
      ggplot(aes(x = plan_type, fill = churned_factor)) +
      geom_bar(position = "fill") +
      scale_fill_viridis_d(labels = c("Active", "Churned")) +
      labs(x = "Plan Type", y = "Proportion", fill = "Status") +
      theme_minimal()
    ggplotly(p)
  })
  
  output$region_churn_plot <- renderPlotly({
    p <- filtered_data() %>%
      ggplot(aes(x = region, fill = churned_factor)) +
      geom_bar(position = "fill") +
      scale_fill_viridis_d(labels = c("Active", "Churned")) +
      labs(x = "Region", y = "Proportion", fill = "Status") +
      theme_minimal()
    ggplotly(p)
  })
  
  output$age_plot <- renderPlotly({
    p <- filtered_data() %>%
      ggplot(aes(x = age, fill = churned_factor)) +
      geom_histogram(bins = 30, alpha = 0.7, position = "identity") +
      scale_fill_viridis_d(labels = c("Active", "Churned")) +
      labs(x = "Age", y = "Count", fill = "Status") +
      theme_minimal()
    ggplotly(p)
  })
  
  output$revenue_plot <- renderPlotly({
    p <- filtered_data() %>%
      ggplot(aes(x = churned_factor, y = total_revenue, fill = churned_factor)) +
      geom_boxplot() +
      scale_fill_viridis_d(labels = c("Active", "Churned")) +
      labs(x = "Status", y = "Total Revenue", fill = "Status") +
      theme_minimal()
    ggplotly(p)
  })
  
  # Data Table
  output$data_table <- renderDT({
    datatable(filtered_data() %>% 
                select(customer_id, age, gender, region, plan_type, 
                       total_revenue, churned_label, satisfaction_score,
                       days_since_activity, usage_intensity),
              options = list(pageLength = 10, scrollX = TRUE)) %>%
      formatStyle("churned_label",
                  backgroundColor = styleEqual(c("Active", "Churned"), 
                                               c("#90EE90", "#FFB6C1")))
  })
  
  # Model Metrics
  output$model_metrics <- renderPrint({
    if (!is.null(models) && !is.null(models$metrics)) {
      print(models$metrics)
    } else {
      cat("Model metrics not available.")
    }
  })
  
  # Confusion Matrix
  output$confusion_matrix <- renderPrint({
    if (!is.null(models) && !is.null(models$confusion_matrix)) {
      print(models$confusion_matrix)
    } else {
      cat("Confusion matrix not available.")
    }
  })
  
  # Feature Importance
  output$feature_importance <- renderPlotly({
    if (!is.null(models) && !is.null(models$importance)) {
      imp <- models$importance
      p <- ggplot(imp, aes(x = reorder(feature, importance), 
                           y = importance, fill = importance)) +
        geom_bar(stat = "identity") +
        coord_flip() +
        scale_fill_viridis_c() +
        labs(x = "", y = "Importance") +
        theme_minimal()
      ggplotly(p)
    } else {
      p <- ggplot(data, aes(x = days_since_activity, y = total_revenue, 
                            color = churned_factor)) +
        geom_point(alpha = 0.3) +
        scale_color_viridis_d(labels = c("Active", "Churned")) +
        labs(x = "Days Since Activity", y = "Total Revenue", color = "Status") +
        theme_minimal()
      ggplotly(p)
    }
  })
  
  # Prediction
  observeEvent(input$predict_btn, {
    risk_score <- 0
    
    if (input$age > 50) risk_score <- risk_score + 10
    if (input$age < 25) risk_score <- risk_score + 5
    
    if (input$plan == "Basic") risk_score <- risk_score + 20
    if (input$plan == "Premium") risk_score <- risk_score - 10
    if (input$plan == "Enterprise") risk_score <- risk_score - 15
    
    if (input$region == "West") risk_score <- risk_score + 10
    if (input$region == "North") risk_score <- risk_score - 5
    
    if (input$usage < 100) risk_score <- risk_score + 20
    if (input$usage > 500) risk_score <- risk_score - 10
    
    if (input$satisfaction < 3) risk_score <- risk_score + 20
    if (input$satisfaction > 4) risk_score <- risk_score - 10
    
    if (input$tickets > 5) risk_score <- risk_score + 15
    if (input$tickets > 10) risk_score <- risk_score + 10
    
    if (input$revenue < 500) risk_score <- risk_score + 10
    if (input$revenue > 2000) risk_score <- risk_score - 10
    
    risk <- min(max(risk_score, 0), 100)
    
    risk_level <- ifelse(risk > 70, "🔴 High Risk", 
                         ifelse(risk > 40, "🟡 Medium Risk", "🟢 Low Risk"))
    
    output$prediction_result <- renderText({
      paste0("Churn Risk: ", risk, "%\n",
             risk_level, "\n",
             "====================================\n",
             "Key Risk Factors:\n",
             ifelse(input$plan == "Basic", "- Basic plan (higher churn)\n", ""),
             ifelse(input$satisfaction < 3, "- Low satisfaction score\n", ""),
             ifelse(input$usage < 100, "- Low usage\n", ""),
             ifelse(input$tickets > 5, "- High support tickets\n", ""),
             ifelse(input$age > 50, "- Age > 50\n", ""),
             "====================================\n",
             ifelse(risk > 40, 
                    "💡 Recommendation: Offer retention incentives",
                    "💡 Recommendation: Continue current engagement"))
    })
  })
  
  # Risk Factors
  output$risk_factors <- renderPlotly({
    risk_factors <- tibble(
      Factor = c("Basic Plan", "Low Satisfaction", "Low Usage", 
                 "High Support Tickets", "Age > 50"),
      Impact = c(25, 22, 18, 15, 10)
    )
    
    p <- ggplot(risk_factors, aes(x = reorder(Factor, Impact), 
                                  y = Impact, fill = Impact)) +
      geom_bar(stat = "identity") +
      coord_flip() +
      scale_fill_viridis_c() +
      labs(x = "", y = "Impact Score") +
      theme_minimal()
    
    ggplotly(p)
  })
}

# ============================
# RUN APP
# ============================

shinyApp(ui, server)
