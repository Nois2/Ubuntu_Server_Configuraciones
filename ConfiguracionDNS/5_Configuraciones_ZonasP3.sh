#!/bin/bash

# Contenido a escribir en el archivo db.inversav4
db_content=$(cat << 'EOF'
;
; BIND reverse data file for local loopback interface
;
$TTL 604800
@       IN      SOA     serverubuntu.semita.sv root.semita.sv. (
                        1        ; Serial
                        604800   ; Refresh
                        86400    ; Retry
                        2419200  ; Expire
                        604800 ) ; Negative Cache TTL
;
@       IN      NS      serverubuntu.semita.sv
2       IN      PTR     serverubuntu.semita.sv.
10      IN      PTR     mail.semita.sv.
5       IN      PTR     tilin.semita.sv.
12      IN      PTR     www.semita.sv.
14      IN      PTR     voip.semita.sv.
EOF
)

# Escribir el contenido en el archivo db.inversav4
echo "$db_content" | sudo tee /etc/bind/db.inversav4 > /dev/null

# Verificar si hay errores en db.inversav4
sudo named-checkzone 0.16.172.in-addr.arpa /etc/bind/db.inversav4
