#!/bin/bash

# Verificar si UFW está instalado
if ! command -v ufw &> /dev/null; then
    # Si no está instalado, instalar UFW
    echo "UFW no está instalado, instalando..."
    sudo apt-get install ufw -y
else
    echo "UFW ya está instalado."
fi

# Permitir conexiones SSH a través del firewall
echo "Permitiendo conexiones SSH a través del firewall..."
sudo ufw allow ssh

# Habilitar el firewall
echo "Habilitando el firewall..."
sudo ufw enable

# Verificar el estado del firewall
echo "Estado del firewall:"
sudo ufw status

# Realizando copias de seguridad de los archivos de configuración SSH
echo "Realizando copias de seguridad de los archivos de configuración SSH..."
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bkp
sudo cp /etc/ssh/ssh_config /etc/ssh/ssh_config.bkp

# Listar los archivos de configuración y sus permisos
echo "Listando archivos de configuración SSH y sus permisos:"
ls -l /etc/ssh

# Reiniciar el servicio SSH
echo "Reiniciando el servicio SSH..."
sudo service ssh restart

# Verificar el estado del servicio SSH
echo "Estado del servicio SSH:"
sudo service ssh status

echo "Recuerda que para acceder al servicio SSH desde otra máquina necesitas:"
echo "ssh usuarioDelServidor@ipdelservidor"
