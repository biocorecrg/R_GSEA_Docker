FROM ubuntu:bionic

# unable interactive dialogue
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update; apt-get -y upgrade
RUN apt-get -y install software-properties-common

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
RUN apt-get update; apt-get -y upgrade
RUN apt -y install r-base

RUN apt-get -y install build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev

RUN Rscript -e 'install.packages("devtools"); library("devtools"); install_github("GSEA-MSigDB/GSEA_R")'


