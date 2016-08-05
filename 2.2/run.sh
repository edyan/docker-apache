#!/bin/sh
usermod -u $APACHE_UID www-data
groupmod -g $APACHE_GID www-data
chown -R www-data:www-data /var/cache/apache2 /var/lib/apache2 /var/www

exec /usr/sbin/apache2ctl -D FOREGROUND
