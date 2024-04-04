#!/bin/bash

# Verificar si Bind9 está instalado
if ! dpkg -l bind9 &> /dev/null
then
    # Si no está instalado, instalar Bind9
    echo "Bind9 no está instalado, instalando..."
    echo $(sudo apt-get install bind9 bind9-utils bind9-doc)
else
    echo "Bind9 ya está instalado."
fi

# Cambiar al directorio /etc/bind
echo "Cambiar al directorio /etc/bind..."
(cd /etc/bind &&
    {
        # Realizar respaldos de archivos de configuración
        echo "Realizando respaldos de archivos de configuración..."
        echo $(sudo cp named.conf.local named.conf.local.bkp)
        echo $(sudo cp named.conf.options named.conf.options.bkp)

        # Crear zonas de traducción a partir de archivos db.local y db.127
        echo "Creando zonas de traducción..."
        echo $(sudo cp db.local db.semita.sv)
        echo $(sudo cp db.127 db.inversav4)
        echo $(sudo cp db.127 db.inversav6)

        # Mostrar todas las copias de seguridad creadas
        echo "Copias de seguridad creadas:"
        echo $(ls -l)
    }
)
