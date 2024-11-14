# Start with the R image
FROM rocker/r-ver:4.3.3

# Install system libraries for dependencies
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    gfortran \
    libblas-dev \
    liblapack-dev \
    && apt-get clean

# Install R packages directly
RUN R -e "install.packages(c('ggplot2', 'quarto', 'dplyr', 'lubridate', 'wordcloud2', 'httr', 'jsonlite'), dependencies = TRUE)"
