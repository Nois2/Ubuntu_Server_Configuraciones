#!/bin/bash

# Actualizar repositorios
echo "Actualizando repositorios..."
echo "$(sudo apt-get update)"

# Instalar Apache2
echo "Instalando Apache2..."
echo "$(sudo apt-get install apache2)"

# Reiniciar Apache2
echo "Reiniciando Apache2..."
echo "$(sudo service apache2 restart)"

# Verificar estado de Apache2
echo "Verificando estado de Apache2..."
echo "$(sudo service apache2 status)"

# Configurar UFW para permitir tráfico al puerto 80
echo "Configurando UFW para permitir tráfico al puerto 80..."

echo "$(sudo ufw allow from 172.16.0.0/24 to 172.16.0.2 app Apache)"
echo "$(sudo ufw allow from 172.16.0.0/24 to 172.16.0.3 app Apache)"
echo "$(sudo ufw allow from 2001:db7:dea::/64 to 2001:db7:dea::2 app Apache)"
echo "$(sudo ufw allow from 2001:db7:dea::/64 to 2001:db7:dea::3 app Apache)"

# Verificar estado de UFW
echo "Verificando estado de UFW..."
echo "$(sudo ufw status numbered)"
