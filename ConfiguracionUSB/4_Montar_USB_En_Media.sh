#!/bin/bash

# Mostrar información sobre el dispositivo montado en sdb
mount | grep sdb

# Montar /dev/sdb1 en /media
sudo mount /dev/sdb1 /media

# Mostrar todas las montajes
mount

# Cambiar al directorio /media
cd /media

# Listar el contenido del directorio /media
ls
