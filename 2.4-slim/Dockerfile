FROM        alpine:3.6
MAINTAINER  Emmanuel Dyan <emmanueldyan@gmail.com>

# Install packages
RUN         apk update && \

            apk upgrade && \

            apk add apache2 apache2-proxy && \

            rm -rf /var/cache/apk/*


# Configure to use php fpm and don't use /var/www to store everything (modules and logs)
RUN         sed -i 's/LoadModule mpm_prefork_module/#LoadModule mpm_prefork_module/g' /etc/apache2/httpd.conf && \
            sed -i 's/#LoadModule mpm_event_module/LoadModule mpm_event_module/g' /etc/apache2/httpd.conf && \
            sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/g' /etc/apache2/httpd.conf && \
            echo "LoadModule slotmem_shm_module modules/mod_slotmem_shm.so" > /etc/apache2/conf.d/slotmem_shm.conf && \

            sed -i 's/var\/www\/localhost\/htdocs/var\/www/g' /etc/apache2/httpd.conf && \
            sed -i 's/ServerRoot \/var\/www/ServerRoot \/usr\/local\/apache/g' /etc/apache2/httpd.conf

# Create / remove directories according to the conf above
RUN         rm -rf /var/www/* && \
            mkdir -p /run/apache2 /usr/local/apache && \
            ln -s /usr/lib/apache2 /usr/local/apache/modules && \
            ln -s /var/log/apache2 /usr/local/apache/logs

COPY        vhost.conf /etc/apache2/conf.d/vhost.conf

ENV         APACHE_UID  100
ENV         APACHE_GID  101

EXPOSE      80 443

COPY        run.sh     /run.sh
RUN         chmod u+x  /run.sh

CMD         ["/run.sh"]
