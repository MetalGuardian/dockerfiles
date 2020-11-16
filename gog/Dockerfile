# https://misha.brukman.net/blog/2020/04/running-decade-old-games-in-containers/

FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
        libasound2-data \
        libasound2 \
        libasound2-plugins \
        libc6 \
        libcanberra-gtk3-module \
        libcanberra-gtk-module \
        libcurl4 \
        libgtk2.0-0 \
        libnss3 \
        libxml2 \
        libxt6 \
        libglu1-mesa \
        libgl1-mesa-glx \
        libgl1-mesa-dri

RUN apt-get install -y \
    pciutils

RUN apt-get install -yq apulse