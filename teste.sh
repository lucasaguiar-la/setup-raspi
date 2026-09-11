cat << 'EOF' > criar_xorg.sh
#!/bin/bash

# Cria o diretório caso ele não exista
sudo mkdir -p /etc/X11/xorg.conf.d

# Escreve o conteúdo no arquivo de configuração
sudo tee /etc/X11/xorg.conf.d/99-fbdev.conf > /dev/null << 'CONF'
Section "Device"
    Identifier "MPI3501"
    Driver "fbdev"
    Option "fbdev" "/dev/fb1"
EndSection

Section "Screen"
    Identifier "Screen0"
    Device "MPI3501"
    DefaultDepth 24

    SubSection "Display"
        Depth 24
        Modes "480x320"
    EndSubSection
EndSection
CONF

echo "Arquivo /etc/X11/xorg.conf.d/99-fbdev.conf criado com sucesso!"
EOF