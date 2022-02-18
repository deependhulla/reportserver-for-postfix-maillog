#!/bin/bash

wget -c https://mariadb.org/mariadb_release_signing_key.asc -O /etc/apt/trusted.gpg.d/mariadb_release_signing_key.asc  
wget -c https://packages.sury.org/php/apt.gpg -O /etc/apt/trusted.gpg.d/php.gpg
chmod -c 644 /etc/apt/trusted.gpg.d/mariadb_release_signing_key.asc
chmod -c 644 /etc/apt/trusted.gpg.d/php.gpg

echo 'deb [arch=amd64] https://mariadb.mirror.liquidtelecom.com/repo/10.6/debian bullseye main' > /etc/apt/sources.list.d/mariadb-and-php.list
echo 'deb https://packages.sury.org/php/ bullseye main' >> /etc/apt/sources.list.d/mariadb-and-php.list

echo "Updating Repo List to get Mariadb 10.6 PHPH8 Repo up.";
apt-get update
apt-get -y upgrade
## installs also apache2
### remove old default lib as php & mariadb repo has latest
apt-get -y autoremove

## installs 
apt-get -y install mariadb-server php apache2 libapache2-mod-php php-mysql php-cli php-common php-imap php-ldap php-xml php-curl php-mbstring php-zip php-apcu php-gd php-imagick imagemagick mcrypt memcached php-memcached php-bcmath dbconfig-common libapache2-mod-php php-intl php-mysql php-intl libdbd-mysql-perl certbot python3-certbot-apache automysqlbackup mariadb-plugin-rocksdb



a2enmod actions > /dev/null 2>&1
a2enmod proxy_fcgi > /dev/null 2>&1
a2enmod fcgid > /dev/null 2>&1
a2enmod alias > /dev/null 2>&1
a2enmod suexec > /dev/null 2>&1
a2enmod rewrite > /dev/null 2>&1
a2enmod ssl > /dev/null 2>&1
a2enmod actions > /dev/null 2>&1
a2enmod include > /dev/null 2>&1
a2enmod dav_fs > /dev/null 2>&1
a2enmod dav > /dev/null 2>&1
a2enmod auth_digest > /dev/null 2>&1
a2enmod cgi > /dev/null 2>&1
a2enmod headers > /dev/null 2>&1
a2enmod proxy_http > /dev/null 2>&1

## keep fpm disabled default if installed by mistake
systemctl stop php.fpm  > /dev/null 2>&1
systemctl disable php-fpm > /dev/null 2>&1



MYSQLPASSVPOP=`pwgen -c -1 8`
echo $MYSQLPASSVPOP > /usr/local/src/mysql-admin-pass
echo "mysql admin password in /usr/local/src/mysql-admin-pass"

echo "GRANT ALL PRIVILEGES ON *.* TO admin@localhost IDENTIFIED BY '$MYSQLPASSVPOP'" with grant option | mysql -uroot
mysqladmin -uroot reload
mysqladmin -uroot refresh


## copy apache2 and other config html files and other program 
/bin/cp -pR files/web-rootdir/* /

apt-get install -y rsyslog-mysql

## for PHP composer package
#echo "installing php composer"
#cd /opt
#php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#php composer-setup.php
#php -r "unlink('composer-setup.php');"
#cd -



