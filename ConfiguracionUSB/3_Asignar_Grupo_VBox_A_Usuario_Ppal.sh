#!/bin/bash

# Obtener información del módulo VBoxGuest
modinfo vboxguest

# Agregar el usuario al grupo vboxsf
sudo usermod --append --groups vboxsf -- usuario

# Mostrar la información del grupo del usuario
cat /etc/group | grep usuario
