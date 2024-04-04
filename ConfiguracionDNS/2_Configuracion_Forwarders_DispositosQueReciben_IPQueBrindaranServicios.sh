#!/bin/bash

# Contenido a escribir en el archivo named.conf.options
options_content=$(cat << 'EOF'
options {
    directory "/var/cache/bind";

    // If there is a firewall between you and nameservers you want
    // to talk to, you may need to fix the firewall to allow multiple
    // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

    // If your ISP provided one or more IP addresses for stable
    // nameservers, you probably want to use them as forwarders.  
    // Uncomment the following block, and insert the addresses replacing
    // the all-0's placeholder.

     forwarders {
         8.8.8.8;
         2001:4060:4060::8888;
     };

    //========================================================================
    // If BIND logs error messages about the root key being expired,
    // you will need to update your keys.  See https://www.isc.org/bind-keys
    //========================================================================
    dnssec-validation auto;
    
    allow-query {172.16.0.2; 2001:db7:dea:a::/64
    localhost; };

    listen-on port 53 {172.16.0.2; 172.16.0.3; };
    listen-on-v6 { 2001:db7:dea:a::2; 2001:db7:dea:a::3; };
};
EOF
)

# Escribir el contenido en el archivo named.conf.options
echo "$options_content" | sudo tee /etc/bind/named.conf.options > /dev/null

# Verificar si hay errores en named.conf.options
sudo $(named-checkconf /etc/bind/named.conf.options)