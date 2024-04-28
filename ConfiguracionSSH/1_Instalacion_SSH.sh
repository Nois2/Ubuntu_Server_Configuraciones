#!/bin/bash

# Actualizamos los paquetes
echo "Actualizando los paquetes..."
sudo apt-get update

# Instalamos el servidor SSH
echo "Instalando el servidor OpenSSH..."
sudo apt-get install openssh-server -y
