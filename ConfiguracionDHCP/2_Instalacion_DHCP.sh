#!/bin/bash

# Actualizar el directorio de paquetes
echo "Actualizando el directorio de paquetes..."
sudo apt update

# Verificar si isc-dhcp-server está instalado y si no, instalarlo
if ! dpkg -l | grep -i isc-dhcp-server &> /dev/null
then
    echo "Instalando isc-dhcp-server..."
    sudo apt-get install isc-dhcp-server
else
    echo "isc-dhcp-server ya está instalado."
fi

# Mensaje informativo
echo "isc-dhcp-server configura la interfaz por la cual se otorgará el servicio DHCPv4 y DHCPv6."
echo "dhcp.conf configura el pool de direcciones IPv4 a otorgar en la red."
echo "dhcpd6.conf configura el pool de direcciones IPv6 a otorgar en la red."

# Realizar respaldos de los archivos originales
echo "Realizando respaldos de los archivos originales..."
sudo cp /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.bkp
sudo cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.bkp
sudo cp /etc/dhcp/dhcpd6.conf /etc/dhcp/dhcpd6.conf.bkp

# Mostrar los últimos dos archivos creados en /etc/dhcp
echo "Archivos creados en /etc/dhcp:"
ls -l /etc/dhcp

# Cambiar al directorio /etc/default
cd /etc/default

# Escribir en el archivo isc-dhcp-server
echo "Configurando isc-dhcp-server..."
sudo bash -c 'cat << EOF > isc-dhcp-server
# Defaults for isc-dhcp-server (sourced by /etc/init.d/isc-dhcp-server)

# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
DHCPDv4_PID=/var/run/dhcpd.pid
DHCPDv6_PID=/var/run/dhcpd6.pid

# Additional options to start dhcpd with.
#   	Don't use options -cf or -pf here; use DHCPD_CONF/ DHCPD_PID instead
OPTIONS="-6"

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#   	Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="enp0s8"
INTERFACESv6="enp0s8"
EOF'

# Mostrar mensaje de éxito
echo "Configuración completada correctamente."
