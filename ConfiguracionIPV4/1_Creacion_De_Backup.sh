#!/bin/bash

# Muestra el directorio actual
echo "Directorio actual:"
echo "$(pwd)"
echo

# Cambia al directorio /etc/netplan y luego imprime el directorio donde estoy
echo "Cambiando al directorio /etc/netplan..."
cd /etc/netplan || exit 1
echo "Directorio actual:"
echo "$(pwd)"
echo

# Se crea una copia de seguridad del archivo de configuración de interfaces de red
echo "Creando copia de seguridad del archivo de configuración..."

if sudo cp 00-installer-config.yaml 00-installer-config.yaml.bkp; then
    echo "Copia de seguridad creada: 00-installer-config.yaml.bkp"
else
    echo "Error: No se pudo crear la copia de seguridad." >&2
    exit 1
fi

# Se muestra la salida para ver si de veras se creó una copia
echo "Contenido del directorio actual:"
echo "$(ls -l)"
