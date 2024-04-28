#!/bin/bash

# Actualizar el directorio de paquetes
echo "Actualizando el directorio de paquetes..."
sudo apt update

# Verificar si isc-dhcp-server está instalado y si no, instalarlo
if ! dpkg -l | grep -i isc-dhcp-server &> /dev/null; then
    echo "Instalando isc-dhcp-server..."
    sudo apt-get install isc-dhcp-server -y
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
ls -l /etc/dhcp | tail -n 2

# Cambiar al directorio /etc/default
cd /etc/default || exit

# Escribir en el archivo isc-dhcp-server
echo "Configurando isc-dhcp-server..."
sudo bash -c 'cat << EOF > isc-dhcp-server
# Configuraciones predeterminadas para isc-dhcp-server (incluso por /etc/init.d/isc-dhcp-server)

# Ruta al archivo de configuración de dhcpd (predeterminado: /etc/dhcp/dhcpd.conf).
DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

# Ruta al archivo PID de dhcpd (predeterminado: /var/run/dhcpd.pid).
DHCPDv4_PID=/var/run/dhcpd.pid
DHCPDv6_PID=/var/run/dhcpd6.pid

# Opciones adicionales para iniciar dhcpd.
#   	No utilice las opciones -cf o -pf aquí; use DHCPD_CONF/ DHCPD_PID en su lugar.
OPTIONS="-6"

# En qué interfaces debería el servidor DHCP (dhcpd) servir las solicitudes DHCP?
#   	Separe múltiples interfaces con espacios, por ejemplo "eth0 eth1".
INTERFACESv4="enp0s8"
INTERFACESv6="enp0s8"
EOF'

# Mostrar mensaje de éxito
echo "Configuración completada correctamente."
