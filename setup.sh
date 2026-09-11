#!/bin/bash

echo "=========================================="
echo "Instalando pacotes..."
echo "=========================================="

sudo apt-get update && sudo apt-get upgrade -y
<<<<<<< HEAD
=======
sudo apt install -y fbi
>>>>>>> fbbe3ea83248661403030d2d5d8a8601c1ebb159

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
<<<<<<< HEAD
echo "Pacotes instalados com sucesso!"
echo "=========================================="
=======
echo "Instalação concluída! Reiniciando em 5s..."
echo "=========================================="
sleep 5
sudo reboot
>>>>>>> fbbe3ea83248661403030d2d5d8a8601c1ebb159
