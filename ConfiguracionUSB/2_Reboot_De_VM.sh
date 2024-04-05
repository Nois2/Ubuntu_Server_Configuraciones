#!/bin/bash

# Solicitar confirmación antes de reiniciar
read -p "¿Estás seguro de que deseas reiniciar el sistema? (s/n): " confirmacion

# Verificar la respuesta
if [ "$confirmacion" == "s" ]; then
    # Reiniciar el sistema
    sudo reboot
elif [ "$confirmacion" == "n" ]; then
    echo "Reinicio cancelado."
else
    echo "Respuesta no válida. Reinicio cancelado."
fi
