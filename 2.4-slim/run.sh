#!/bin/sh
sed -i "s/:100:101:apache:/:$APACHE_UID:$APACHE_GID:apache:/g" /etc/passwd
sed -i "s/:101:apache/:$APACHE_GID:apache/g" /etc/group
chown -R apache:apache /run/apache2 /var/www 

exec /usr/sbin/httpd -DFOREGROUND;
