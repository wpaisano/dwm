#!/bin/bash

# Variável com o link do repositório
REPO_URL="https://github.com/wpaisano/dwm"
REPO_DIR="dwm"

# Atualizando o sistema base
echo "Atualizando o sistema..."
sudo xbps-install -Syu -y

# Instalando o Git, caso não esteja instalado
echo "Verificando instalação do Git..."
sudo xbps-install -y git

# Clonando o repositório, caso ainda não esteja presente
if [ ! -d "$REPO_DIR" ]; then
    echo "Clonando o repositório..."
    git clone "$REPO_URL"
else
    echo "Repositório já existe, atualizando..."
    cd "$REPO_DIR"
    git pull
    cd ..
fi

# Acessando o diretório do repositório
cd "$REPO_DIR" || exit

# Instalando pacotes do arquivo packages.txt
echo "Instalando pacotes listados no arquivo packages.txt..."
xargs -a packages.txt sudo xbps-install -y

echo "Instalação concluída!"

