#!/bin/bash

# Actualizamos los paquetes
echo "Actualizando los paquetes..."
apt-get update

# Instalamos el servidor SSH
echo "Instalando el servidor OpenSSH..."
apt-get install openssh-server
