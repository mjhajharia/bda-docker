ARG R
ARG BUILD_DATE
ARG VCS_REF

FROM rocker/r-ver${R}:latest

LABEL maintainer="Meenal Jhajharia <meenal@mjhajharia.com>" \
      org.opencontainers.image.authors="Meenal Jhajharia" \
      org.opencontainers.image.url="https://hub.docker.com/repository/docker/meenaljhajharia/bda-docker" \
      org.label-schema.vcs-url="https://github.com/mjhajharia/bda-docker" \
      org.label-schema.license="MIT"

# install tinytex linux dependencies, pandoc, and rmarkdown
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    git \
    gdebi-core \
    wget \
    graphviz \
    perl && \
    /rocker_scripts/install_pandoc.sh && \
    install2.r rmarkdown && \
    install2.r tidyverse && \
    install2.r knitr && \
    install2.r devtools && \
    install2.r shiny && \
    install2.r rstan && \
    install2.r brms && \
    install2.r magrittr && \
    install2.r bayesplot



# install tinytex
RUN Rscript -e 'tinytex::install_tinytex()'
# install quarto
RUN curl -LO https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.211/quarto-1.3.211-linux-amd64.deb
RUN gdebi --non-interactive quarto-1.3.211-linux-amd64.deb
