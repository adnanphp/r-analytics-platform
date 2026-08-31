FROM rocker/tidyverse:4.3.1
RUN R -e "install.packages(c('shiny', 'shinydashboard', 'shinyWidgets', 'plotly', 'DT', 'viridis', 'rmarkdown'), repos='https://cloud.r-project.org')"
COPY shiny/ /srv/shiny-server/
COPY data/ /srv/shiny-server/data/
COPY models/ /srv/shiny-server/models/
WORKDIR /srv/shiny-server
CMD ["R", "-e", "shiny::runApp('app.R', host = '0.0.0.0', port = 3838)"]
