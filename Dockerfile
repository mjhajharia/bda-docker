FROM rocker/r-ver:4.2.2

LABEL maintainer="Meenal Jhajharia <meenal@mjhajharia.com>" \
      org.opencontainers.image.authors="Meenal Jhajharia" \
      org.opencontainers.image.url="https://hub.docker.com/repository/docker/meenaljhajharia/bda-docker" \
      org.label-schema.vcs-url="https://github.com/mjhajharia/bda-docker" \
      org.label-schema.license="MIT"

ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=2022.12.0+353
ENV DEFAULT_USER=rstudio
ENV PANDOC_VERSION=default
ENV QUARTO_VERSION=1.3.211

RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh
RUN /rocker_scripts/install_quarto.sh
RUN /rocker_scripts/install_tidyverse.sh
RUN /rocker_scripts/install_jupyter.sh
RUN /rocker_scripts/install_julia.sh

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    r-cran-curl \
    git \
    curl \
    gdebi-core \
    && rm -rf /var/lib/apt/lists/*

# Install R packages
RUN install2.r knitr devtools magrittr rmarkdown rstan brms bayesplot rstanarm shiny
# install tinytex
RUN quarto install tinytex
RUN pip install jupyter-cache

EXPOSE 8787
CMD ["/init"]