# docker/Dockerfile.fast
# Use pre-built image with tidyverse already installed

FROM rocker/tidyverse:4.3.1

# Install Shiny packages only
RUN R -e "install.packages(c('shiny', 'shinydashboard', 'shinyWidgets', 'plotly', 'DT'))"

# Copy application
COPY app/ /app/shiny/
COPY data/ /app/data/
COPY models/ /app/models/

WORKDIR /app

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('shiny/app.R', host = '0.0.0.0', port = 3838)"]
