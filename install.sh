#!/bin/bash

# Atualizar repositórios
echo "Atualizando repositórios..."
sudo xbps-install -Syu

# Instalar os pacotes listados no arquivo packages.txt
echo "Instalando pacotes do packages.txt..."
xargs -a packages.txt sudo xbps-install -y

echo "Instalação concluída!"
