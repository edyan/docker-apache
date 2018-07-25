#!/bin/sh
CURRENT_APACHE_ID=$(id -u apache)
if [ "$CURRENT_APACHE_ID" != "$APACHE_UID" ]; then
    echo "Fixing permissions for Apache"
    sed -i "s/:100:101:apache:/:$APACHE_UID:$APACHE_GID:apache:/g" /etc/passwd
    sed -i "s/:101:apache/:$APACHE_GID:apache/g" /etc/group
    chown -R apache:apache /run/apache2 /var/www
fi

exec /usr/sbin/httpd -DFOREGROUND;
