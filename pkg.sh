#!/bin/bash

echo "=========================================="
echo "Instalando pacotes..."
echo "=========================================="

sudo apt-get update && sudo apt-get upgrade -y

sudo apt install -y \
    fbi \
    cmake \
    build-essential \
    pkg-config \
    libavcodec-dev \
    libcurl4-openssl-dev \
    libavutil-dev \
    libexpat1-dev \
    libasound2-dev \
    libpulse-dev \
    libudev-dev \
    libevdev-dev \
    libenet-dev \
    libopus-dev \
    libsdl2-dev \
    libavahi-client-dev \
    libsdl2-ttf-dev \
    libegl1-mesa-dev \
    libgles2-mesa-dev \
    xorg-dev

echo "=========================================="
echo "Pacotes instalados com sucesso!"
echo "=========================================="