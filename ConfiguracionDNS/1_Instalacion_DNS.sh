#!/bin/bash

# Verificar si Bind9 está instalado
if ! dpkg -l bind9 &> /dev/null; then
    # Si no está instalado, instalar Bind9
    echo "Bind9 no está instalado, instalando..."
    sudo apt-get update && sudo apt-get install bind9 bind9-utils bind9-doc -y
else
    echo "Bind9 ya está instalado."
fi

# Cambiar al directorio /etc/bind
echo "Cambiando al directorio /etc/bind..."
cd /etc/bind || exit 1

{
    # Realizar respaldos de archivos de configuración
    echo "Realizando respaldos de archivos de configuración..."
    sudo cp named.conf.local named.conf.local.bkp
    sudo cp named.conf.options named.conf.options.bkp

    # Crear zonas de traducción a partir de archivos db.local y db.127
    echo "Creando zonas de traducción..."
    sudo cp db.local db.semita.sv
    sudo cp db.127 db.inversav4
    sudo cp db.127 db.inversav6

    # Mostrar todas las copias de seguridad creadas
    echo "Copias de seguridad creadas:"
    ls -l
}

echo "Proceso completado."
