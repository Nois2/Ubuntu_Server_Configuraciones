#!/bin/bash

# Cambia al directorio /etc/netplan
cd /etc/netplan || exit 1

# Muestra los archivos del directorio /etc/netplan
echo "Archivos en el directorio /etc/netplan:"
ls
echo

# Contenido para agregar al archivo 00-installer-config.yaml
network_config=$(cat << 'EOF'
# This is the network config written by 'subiquity'
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: true
      dhcp6: true
      optional: true

    enp0s8:
      addresses: [172.16.0.2/24, 172.16.0.3/24, '2001:DB7:DEA:A::2/64', '2001:DB7:DEA:A::3/64']
      nameservers:
        addresses: [172.16.0.2, '2001:DB7:DEA:A::2', '2001:4860:4860::8888']
      dhcp4: false
      dhcp6: false
      optional: true
EOF
)

# Escribe el contenido en el archivo 00-installer-config.yaml
echo "Escribiendo en el archivo 00-installer-config.yaml..."
echo "$network_config" >00-installer-config.yaml

# Verifica si la escritura fue exitosa
if [ $? -eq 0 ]; then
    echo "El contenido se ha agregado correctamente al archivo 00-installer-config.yaml."
else
    echo "Error: No se pudo agregar el contenido al archivo 00-installer-config.yaml." >&2
fi
