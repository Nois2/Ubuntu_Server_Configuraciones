#!/bin/bash

# Contenido a escribir en el archivo db.inversav6
db_content=$(cat << 'EOF'
;
; BIND reverse data file for local loopback interface
;
$TTL 604800
@       IN      SOA     serverubuntu.semita.sv. root.semita.sv. (
                        1        ; Serial
                        604800   ; Refresh
                        86400    ; Retry
                        2419200  ; Expire
                        604800 ) ; Negative Cache TTL

@       IN      NS      NOMBRE_DE_DOMINIO.

2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0       IN      PTR     serverubuntu.semita.sv.
1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0       IN      PTR     mail.semita.sv.
5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0       IN      PTR     tilin.semita.sv.
2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0       IN      PTR     www.semita.sv.
4.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0       IN      PTR     voip.semita.sv.
EOF
)

# Escribir el contenido en el archivo db.inversav6
echo "$db_content" | sudo tee /etc/bind/db.inversav6 > /dev/null

# Verificar si hay errores en db.inversav6
if ! sudo named-checkzone a.0.0.0.a.e.d.0.7.b.d.0.1.0.0.2.ip6.arpa /etc/bind/db.inversav6; then
    echo "Error: Se encontraron errores en db.inversav6."
fi

# Reiniciar el servicio bind9
sudo service bind9 restart

# Verificar el estado del servicio bind9
echo "Estado del servicio bind9:"
sudo service bind9 status
