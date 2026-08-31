FROM rocker/shiny:4.3.1

# Install ALL required packages
RUN R -e "install.packages(c('shiny', 'shinydashboard', 'shinyWidgets', 'tidyverse', 'ggplot2', 'plotly', 'DT', 'viridis', 'rmarkdown', 'lubridate', 'scales'), repos='https://cloud.r-project.org')"

# Copy application
COPY shiny/ /srv/shiny-server/
COPY data/ /srv/shiny-server/data/
COPY models/ /srv/shiny-server/models/

WORKDIR /srv/shiny-server

CMD ["R", "-e", "shiny::runApp('app.R', host = '0.0.0.0', port = 3838)"]
