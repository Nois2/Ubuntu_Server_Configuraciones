#!/bin/bash

# Actualizamos los paquetes
echo "Actualizando los paquetes..."
echo $(apt-get update)

# Instalamos el servidor SSH
echo "Instalando el servidor OpenSSH..."
echo $(apt-get install openssh-server)
