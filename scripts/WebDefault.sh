#!/bin/bash

FTPUSER=${ftp_user}
FTPPASS=${ftp_pass}
DBADDRESS=${db_address}
DBNAME=${db_name}
DBUSERNAME=${db_user}
DBPASS=${db_pass}

yum update -y
yum install -y mc htop iotop vim screen
yum install -y httpd php php-mysql php-gd vsftpd

setsebool -P httpd_can_network_connect 1
setsebool -P httpd_can_network_connect_db on
systemctl enable httpd.service
systemctl start  httpd.service
#echo "<?php phpinfo(); ?>" > /var/www/html/index.php
#yum install salt-minion

#Install Wordpress
#OR using CURL
curl -LO http://wordpress.org/latest.tar.gz

#De-compress the tarball
tar -zxvf latest.tar.gz

WBASE="/var/www/html"
#Copy everything from the new WordPress Directory into current directory
cp -rvf wordpress/* /var/www/html

#Remove the wordpress folder
rm -R wordpress

#remove the tarball
rm latest.tar.gz


sed -i~ '/^anonymous_enable=YES/s/YES/NO/g' /etc/vsftpd/vsftpd.conf
sed -i~ '/^listen=NO/s/NO/YES/g' /etc/vsftpd/vsftpd.conf
sed -i~ '/^#chroot_local_user=YES/s/#//g' /etc/vsftpd/vsftpd.conf
sed -i~ '/^listen_ipv6=YES/s/listen/#listen/g' /etc/vsftpd/vsftpd.conf

setsebool -P httpd_can_connect_ftp 1
setsebool -P ftpd_full_access 1
systemctl restart  vsftpd.service

adduser -d /var/www $FTPUSER
echo "$FTPUSER:$FTPPASS" |chpasswd

echo "
<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */


/* MySQL settings */
define( 'DB_NAME',     '$DBNAME' );
define( 'DB_USER',     '$DBUSERNAME' );
define( 'DB_PASSWORD', '$DBPASS' );
define( 'DB_HOST',     '$DBADDRESS' );
define( 'DB_CHARSET',  'utf8' );


/* MySQL database table prefix. */
\$table_prefix = 'wp_';


/* WordPress Localized Language. */
define( 'WPLANG', '' );


/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
        define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
" > /var/www/html/wp-config.php

curl https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/html/wp-config.php



echo "define( 'FTP_BASE', '/html' );" >>$WBASE/wp-config.php
echo "define('FTP_CONTENT_DIR', '/html/wp-content');" >>$WBASE/wp-config.php

chown -R $FTPUSER $WBASE

