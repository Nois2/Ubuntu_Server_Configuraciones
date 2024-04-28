#!/bin/bash

# Contenido a escribir en el archivo db.semita.sv
db_content=$(cat << 'EOF'
; BIND data file for local loopback interface
$TTL 604800
@       IN      SOA     serverubuntu.semita.sv. root.semita.sv. (
                        2       ; Serial
                        604800   ; Refresh
                        86400    ; Retry
                        2419200  ; Expire
                        604800 ) ; Negative Cache TTL

@       IN      NS      serverubuntu.semita.sv.

serverubuntu.semita.sv.     IN      A       172.16.0.2
                            IN      AAAA    2001:db7:dea:a::2

mail.semita.sv.             IN      A       172.16.0.10
                            IN      AAAA    2001:db7:dea:a::10

tilin.semita.sv.            IN      A       172.16.0.5
                            IN      AAAA    2001:db7:dea:a::5

www.semita.sv.              IN      A       172.16.0.12
                            IN      AAAA    2001:db7:dea:a::12

voip.semita.sv.             IN      A       172.16.0.14
                            IN      AAAA    2001:db7:dea:a::14
EOF
)

# Escribir el contenido en el archivo db.semita.sv
echo "$db_content" | sudo tee /etc/bind/db.semita.sv > /dev/null

# Verificar si hay errores en db.semita.sv
if ! sudo named-checkzone semita.sv /etc/bind/db.semita.sv; then
    echo "Error: Se encontraron errores en db.semita.sv."
fi
