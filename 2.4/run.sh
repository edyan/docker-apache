#!/bin/sh
usermod -u $APACHE_UID www-data
groupmod -g $APACHE_GID www-data
chown -R www-data:www-data /var/cache/apache2 /var/lib/apache2 /var/www /run/lock/apache2

exec /usr/sbin/apache2ctl -D FOREGROUND
