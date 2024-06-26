#!/bin/bash

# Mensaje informativo
echo "Configurando reglas de firewall para permitir tráfico en los puertos 67, 68, 53, 80, 22 y 547 para IPv4 e IPv6..."

# Permitir tráfico en los puertos especificados para IPv4 e IPv6
echo "Permitiendo tráfico en los puertos especificados para IPv4 e IPv6..."
sudo ufw allow 67/tcp
sudo ufw allow 67/udp
sudo ufw allow 68/tcp
sudo ufw allow 68/udp
sudo ufw allow 53/tcp
sudo ufw allow 53/udp
sudo ufw allow 80/tcp
sudo ufw allow 22/tcp
sudo ufw allow 22/udp
sudo ufw allow 547/tcp
sudo ufw allow 547/udp

# Mostrar el estado actual del firewall
echo "Estado actual del firewall:"
sudo ufw status
