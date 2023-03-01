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
- Julia
- Jupyter

## quickstart

`docker run --rm -ti -e PASSWORD=yourpassword -p 8787:8787 meenaljhajharia/bda-docker:latest`
