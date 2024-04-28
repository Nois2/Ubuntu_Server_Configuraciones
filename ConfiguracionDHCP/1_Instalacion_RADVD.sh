#!/bin/bash

# Mensaje informativo
echo "Configurando servidor radvd..."

# Actualizar los repositorios
echo "Actualizando repositorios..."
sudo apt-get update

# Verificar si radvd está instalado y si no, instalarlo
if ! command -v radvd &> /dev/null; then
    echo "radvd no está instalado. Instalando..."
    sudo apt-get install radvd -y
else
    echo "radvd ya está instalado."
fi

# Cambiar al directorio /etc
cd /etc || exit

# Crear el archivo de configuración radvd.conf
echo "Creando archivo de configuración radvd.conf en $(pwd)..."
sudo bash -c 'cat << EOF > radvd.conf
interface enp0s8
{
    AdvSendAdvert on;
    AdvManagedFlag on;
    AdvDefaultLifetime 0;
    MaxRtrAdvInterval 5;
    MinRtrAdvInterval 3;
    AdvOtherConfigFlag off;
    UnicastOnly on;

    prefix 2001:db7:dea:a::/64
    {
        AdvAutonomous off;
        AdvRouterAddr off;
    };
};
EOF'

# Reiniciar el servicio radvd
echo "Reiniciando el servicio radvd..."
sudo service radvd restart

# Mostrar el estado del servicio radvd
echo "Estado del servicio radvd:"
sudo service radvd status
