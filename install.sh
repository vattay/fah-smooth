#! /bin/bash

sudo apt update && \
sudo apt install -f -y ocl-icd-opencl-dev && \
sudo apt install -f -y ./debs/fahclient_7.5.1_amd64.deb && \
sudo apt install -f -y ./debs/fahcontrol_7.5.1-1_all.deb && \
sudo apt install -f -y ./debs/fahviewer_7.5.1_amd64.deb
