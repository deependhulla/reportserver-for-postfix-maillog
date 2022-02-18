#!/bin/sh

##/bin/cp files/rootdir/etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/
sed -i "s/powermail\.mydomainname\.com/`hostname -f`/" /etc/apache2/sites-available/default-ssl.conf
sed -i "s/SSLCertificateFile	\/etc\/ssl\/certs\/ssl-cert-snakeoil\.pem/ /" /etc/apache2/sites-available/default-ssl.conf
sed -i "s/SSLCertificateKeyFile \/etc\/ssl\/private\/ssl-cert-snakeoil\.key/ /" /etc/apache2/sites-available/default-ssl.conf
sed -i "s/#XSLCertificateFile/SSLCertificateFile/" /etc/apache2/sites-available/default-ssl.conf
sed -i "s/#XSLCertificateKeyFile/SSLCertificateKeyFile/" /etc/apache2/sites-available/default-ssl.conf
sed -i "s/#XSLCertificateChainFile/SSLCertificateChainFile/" /etc/apache2/sites-available/default-ssl.conf
sed -i "s/powermail\.mydomainname\.com/`hostname -f`/" /etc/apache2/sites-available/000-default.conf
sed -i "s/#RewriteEngine/RewriteEngine/" /etc/apache2/sites-available/000-default.conf
sed -i "s/#RewriteCond/RewriteCond/" /etc/apache2/sites-available/000-default.conf
sed -i "s/#RewriteRule/RewriteRule/" /etc/apache2/sites-available/000-default.conf
ln -vs /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/
/etc/init.d/apache2 restart


#cp files/rootdir/usr/local/src/cert-renew-and-restart.sh /usr/local/src/
#sed -i "s/powermail\.mydomainname\.com/`hostname -f`/" /usr/local/src/cert-renew-and-restart.sh

