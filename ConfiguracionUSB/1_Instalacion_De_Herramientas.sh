#!/bin/bash

# Instalación de GCC, Make, Bzip2 y Tar
sudo apt-get update
sudo apt-get install -y gcc make bzip2 tar

# Crear directorio para montar el CD-ROM
sudo mkdir -p /media/cdrom

# Montar el CD-ROM en el directorio creado
sudo mount /dev/cdrom /media/cdrom

# Ejecutar el archivo de instalación de VBoxLinuxAdditions
sudo /media/cdrom/VBoxLinuxAdditions.run

# Desmontar el CD-ROM después de la instalación
# sudo umount /media/cdrom

echo "Instalación completada."
