#!/usr/bin/env bash

ip=$1
domain=$2

if [ -z $domain ]; then
    echo -en "Enter the domain for your new site (default: wordpress.local): "
    read domain
    if [ -z $domain ]; then
        domain=wordpress.local
    fi
fi

if [ -z $ip ]; then
    echo -en "Enter IP for the Vagrant machine to use (default: 192.168.30.11): "
    read ip
    if [ -z $ip ]; then
        ip=192.168.30.11
    fi
fi

echo "Building Vagrantfile"
sed -i '' -e "s/\[IP\]/$ip/g" Vagrantfile

echo "Building Virtual Host config file"
sed -i '' -e "s/\[DOMAIN\]/$domain/g" provision/wordpress

echo "Creating .env file"
echo -e "
DB_NAME=wordpress
DB_USER=root
DB_PASSWORD=root
DB_HOST=localhost

WP_ENV=development
WP_HOME=http://$domain
WP_SITEURL=http://$domain/wp
" > .env

cat <<EOF

========================
   Project configured
========================
IP: $ip
Domain: $domain
Site URL: http://$domain
Admin URL: http://$domain/wp/wp-admin

You can now run "vagrant up" command.

Please remember to update your /etc/hosts file with the following entry:
$ip $domain

EOF

rm $0 # self-removal
