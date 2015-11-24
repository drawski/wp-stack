#!/usr/bin/env bash

apt-get update

debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

apt-get install -y vim curl python-software-properties
add-apt-repository -y ppa:ondrej/php5
apt-get update

apt-get install -y php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-readline mysql-server-5.5 php5-mysql git-core php5-xdebug

a2enmod rewrite
a2enmod ssl
a2enmod headers

if [ ! -h /etc/apache2/sites-available/wordpress ]; then
	ln -sf /vagrant/provision/wordpress /etc/apache2/sites-available/wordpress.conf
fi

if [ ! -f /etc/ssl/server.cert ]; then
	cd /etc/ssl
	openssl req  -nodes -new -x509  -keyout server.key -out server.cert -subj "/C=DK/ST=Nowhere/O=NoName"
fi

a2dissite 000-default
a2ensite wordpress

sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini
sed -i "s/disable_functions = .*/disable_functions = /" /etc/php5/cli/php.ini
sed -i "s/APACHE_RUN_USER=.*/APACHE_RUN_USER=vagrant/" /etc/apache2/envvars
sed -i "s/APACHE_RUN_GROUP=.*/APACHE_RUN_GROUP=vagrant/" /etc/apache2/envvars

service apache2 restart

mysql -h localhost -uroot -proot -e "CREATE DATABASE IF NOT EXISTS wordpress"

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
