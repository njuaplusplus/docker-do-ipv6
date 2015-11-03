#!/bin/bash

if grep -q inet6 /tmp/interfaces ; then
    echo "Error: "
    echo "    You have already set the ipv6 address!"
    exit 1
fi

if [ -z "${IPV6_ADDR}" ]; then
    echo "Error: "
    echo "    Please define IPV6_ADDR"
    exit 1
fi

if [ -z "${IPV6_GATEWAY}" ]; then
    echo "Error: "
    echo "    Please define IPV6_GATEWAY"
    exit 1
fi

sed -i -e "s/dns-nam.*//g" /tmp/interfaces
cat << EOF >> /tmp/interfaces
iface eth0 inet6 static
        address ${IPV6_ADDR}
        netmask 64
        gateway ${IPV6_GATEWAY}
        autoconf 0
        dns-nameservers 2001:4860:4860::8844 2001:4860:4860::8888 8.8.8.8
EOF
