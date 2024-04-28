#!/bin/bash

# Contenido a escribir en el archivo named.conf.local
local_content=$(cat << 'EOF'
// Incluir zonas RFC1918
include "/etc/bind/zones.rfc1918";

// ZONA DIRECTA
zone "semita.sv" {
    type master;
    file "/etc/bind/db.semita.sv";
};

// ZONA INVERSA IPV4
zone "0.16.172.in-addr.arpa" {
    type master;
    file "/etc/bind/db.inversav4";
};

// ZONA INVERSA IPV6
zone "a.0.0.0.a.e.d.0.7.b.d.0.1.0.0.2.ip6.arpa" {
    type master;
    file "/etc/bind/db.inversav6";
};
EOF
)

# Escribir el contenido en el archivo named.conf.local
echo "$local_content" | sudo tee /etc/bind/named.conf.local > /dev/null

# Verificar si hay errores en named.conf.local
if ! sudo named-checkconf /etc/bind/named.conf.local; then
    echo "Error: Se encontraron errores en named.conf.local."
fi
