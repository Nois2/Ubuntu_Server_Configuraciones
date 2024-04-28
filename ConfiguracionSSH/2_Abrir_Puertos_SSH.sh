#!/bin/bash

# Verificar si ufw está instalado
if ! command -v ufw &> /dev/null; then
    echo "ufw no está instalado. Instalando ufw..."
    sudo apt update && sudo apt install ufw -y
fi

# Permitir conexiones SSH a través del firewall
echo "Permitiendo conexiones SSH a través del firewall..."
sudo ufw allow ssh

# Habilitar el firewall
echo "Habilitando el firewall..."
sudo ufw --force enable

# Verificar el estado del firewall
echo "Estado del firewall:"
sudo ufw status verbose

# Reiniciar el servicio SSH
echo "Reiniciando el servicio SSH..."
sudo systemctl restart ssh

# Verificar el estado del servicio SSH
echo "Estado del servicio SSH:"
sudo systemctl status ssh --no-pager

echo "Recuerda que para acceder al servicio SSH desde otra máquina necesitas:"
echo "ssh usuarioDelServidor@ipdelservidor"
