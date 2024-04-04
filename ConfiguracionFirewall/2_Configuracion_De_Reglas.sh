#!/bin/bash

# Mensaje informativo
echo "Configurando reglas de firewall para permitir tráfico en los puertos 67, 68, 53, 80 y 22 para IPv4 e IPv6..."

# Permitir tráfico en los puertos especificados para IPv4 e IPv6
echo "Permitiendo tráfico en los puertos especificados para IPv4 e IPv6..."
$(echo "Permitiendo tráfico en el puerto 67/tcp..." && sudo ufw allow 67/tcp)
$(echo "Permitiendo tráfico en el puerto 67/udp..." && sudo ufw allow 67/udp)
$(echo "Permitiendo tráfico en el puerto 68/tcp..." && sudo ufw allow 68/tcp)
$(echo "Permitiendo tráfico en el puerto 68/udp..." && sudo ufw allow 68/udp)
$(echo "Permitiendo tráfico en el puerto 53/tcp..." && sudo ufw allow 53/tcp)
$(echo "Permitiendo tráfico en el puerto 53/udp..." && sudo ufw allow 53/udp)
$(echo "Permitiendo tráfico en el puerto 80/tcp..." && sudo ufw allow 80/tcp)
$(echo "Permitiendo tráfico en el puerto 22/tcp..." && sudo ufw allow 22/tcp)

# Mostrar el estado actual del firewall
echo "Estado actual del firewall:"
echo $(sudo ufw status)
