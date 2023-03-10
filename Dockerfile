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
    liblapack-dev libopenblas-dev \
    && rm -rf /var/lib/apt/lists/*

#install jupyter cache for quarto
RUN pip install jupyter-cache

# Install R packages
RUN install2.r --deps TRUE devtools  markmyassignment latex2exp  gganimate ggforce gridExtra
RUN install2.r --deps TRUE tidyverse  tidybayes 

RUN Rscript -e "install.packages('cmdstanr', repos = c('https://mc-stan.org/r-packages/', getOption('repos')))"

RUN install2.r --deps TRUE \
    --repos 'http://cran.rstudio.com' \
    --repos 'https://mc-stan.org/r-packages/' \
    --repos 'https://cloud.r-project.org' \
    --repos 'https://cran.rstudio.com' \
    --repos 'https://cran.r-project.org' \
    rstan brms bayesplot rstanarm shinystan

RUN Rscript -e "remotes::install_github('avehtari/BDA_course_Aalto', subdir = 'rpackage', upgrade='never')"

RUN Rscript -e "install.packages('tinytex'); tinytex::install_tinytex(force=TRUE)"

# install tinytex
RUN quarto install tinytex

#start rstudio
EXPOSE 8787
CMD ["/init"]