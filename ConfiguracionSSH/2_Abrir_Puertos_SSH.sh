#!/bin/bash

# Verificar si ufw está instalado
if ! command -v ufw &> /dev/null; then
    echo "ufw no está instalado. Instalando ufw..."
    sudo apt update
    sudo apt install ufw -y
fi

# Permitir conexiones SSH a través del firewall
echo "Permitiendo conexiones SSH a través del firewall..."
echo $(sudo ufw allow ssh)

# Verificar el estado del firewall
echo "Estado del firewall:"
echo $(sudo ufw status)

# Reiniciar el servicio SSH
echo "Reiniciando el servicio SSH..."
echo $(sudo service ssh restart)

# Verificar el estado del servicio SSH
echo "Estado del servicio SSH:"
echo $(sudo service ssh status)

echo "Recuerda que para acceder al servicio SSH desde otra máquina necesitas:"
echo "ssh usuarioDelServidor@ipdelservidor"
