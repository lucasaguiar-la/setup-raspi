#!/bin/bash

# 1. Atualizar e instalar ferramentas iniciais
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install -y git fbi

# 2. Configurar a tela (Driver mpi3501)
if [ ! -d "mpi3501-kernel-6.12-driver" ]; then
    git clone https://github.com/chessarisilvio/mpi3501-kernel-6.12-driver.git
fi

cd mpi3501-kernel-6.12-driver || exit
sudo cp mpi3501-custom.dtbo /boot/firmware/overlays/
cd ..

# Adiciona configurações no config.txt se ainda não existirem
if ! grep -q "mpi3501-custom" /boot/firmware/config.txt; then
    sudo sed -i 's/^dtoverlay=vc4-kms-v3d/#dtoverlay=vc4-kms-v3d/' /boot/firmware/config.txt
    echo -e "\ndtparam=spi=on\ndtoverlay=mpi3501-custom\ngpu_mem=128" | sudo tee -a /boot/firmware/config.txt
fi

# Configura o cmdline.txt para o framebuffer
if ! grep -q "fbcon=map:1" /boot/firmware/cmdline.txt; then
    sudo sed -i 's/$/ fbcon=map:1/' /boot/firmware/cmdline.txt
fi

# 3. Instalar dependências pesadas do Moonlight
sudo apt install -y cmake build-essential pkg-config libavcodec-dev libcurl4-openssl-dev \
libavutil-dev libexpat1-dev libasound2-dev libpulse-dev libudev-dev libevdev-dev \
libenet-dev libopus-dev libsdl2-dev libavahi-client-dev libsdl2-ttf-dev \
libegl1-mesa-dev libgles2-mesa-dev xorg-dev

# 4. Compilar e instalar o Moonlight Embedded
if [ ! -d "moonlight-embedded" ]; then
    git clone --recursive https://github.com/moonlight-stream/moonlight-embedded.git
fi

cd moonlight-embedded || exit
mkdir -p build && cd build
cmake ..
make -j2
sudo make install
sudo ldconfig
cd ../..

echo "=========================================="
echo "Instalação concluída! Reiniciando em 5s..."
echo "=========================================="
sleep 5
sudo reboot