bda-docker
================

[![pulls](https://img.shields.io/docker/pulls/meenaljhajharia/bda-docker)](https://hub.docker.com/r/meenaljhajharia/bda-docker "Number of pulls from Docker Hub")
![image](https://img.shields.io/docker/image-size/meenaljhajharia/bda-docker/latest)
[![dockerfile](https://img.shields.io/badge/dockerfile%20on-github-blue.svg)](https://github.com/meenaljhajharia/bda-docker "Dockerfile source repository")
[![base](https://img.shields.io/badge/depends%20on-rocker%2Fr--ver-blue)](https://hub.docker.com/r/rocker/r-ver "Docker base image")

Includes:

- base R (uses [rocker/r-ver](https://hub.docker.com/r/rocker/r-ver/))
- pandoc
- rmarkdown and dependencies
- tinytex
- Quarto
- tidyverse
- rstan, brms, bayesplot

## Build image

```bash
# latest R version
docker build . -t bda-docker --build-arg R=latest

# specific R version
docker build . -t bda-docker --build-arg R=4.0.2
```

## Run container and knit test document automatically

```bash
cd # to wherever this folder is
docker run --rm -v $PWD:/home -w /home meenaljhajharia/bda-docker \
  Rscript -e 'rmarkdown::render("test.Rmd")'
```

## Run container and knit test document interactively

```bash
cd # to wherever this folder is
docker run --rm -it -v $PWD:/home -w /home meenaljhajharia/bda-docker R
```

```r 
rmarkdown::render("test.Rmd")
```
