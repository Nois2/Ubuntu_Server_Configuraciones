#!/bin/bash

# Muestra el directorio actual
echo $(pwd)
# Cambia al directorio /etc/netplan y luego imprime el directorio donde estoy
cd /etc/netplan
echo $(pwd)

# Muestra un salto de linea
echo \n

# Se crea una copia de seguridad del archivo de configuración de interfaces de red

sudo cp 00-installer-config.yaml 00-installer-config.yaml.bkp

# Se muestra la salida para ver si de veras se creo una copia
echo $(ls -l)