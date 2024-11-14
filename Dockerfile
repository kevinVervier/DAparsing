# Start with the R image
FROM rocker/r-ver:4.3.3

# Install system dependencies for R packages and Quarto
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    gfortran \
    libblas-dev \
    liblapack-dev \
    wget \
    pandoc \
    && apt-get clean

# Install Quarto CLI
RUN wget -qO- https://quarto.org/download/latest/quarto-linux-amd64.deb > quarto.deb \
    && dpkg -i quarto.deb \
    && rm quarto.deb

# Install required R packages and their dependencies
RUN R -e "install.packages(c('ggplot2', 'dplyr', 'lubridate', 'wordcloud2', 'httr', 'jsonlite'), dependencies = TRUE)"

# Set the default working directory
WORKDIR /workspace
