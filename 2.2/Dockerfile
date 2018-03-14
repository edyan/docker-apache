FROM        debian:wheezy-slim
MAINTAINER  Emmanuel Dyan <emmanueldyan@gmail.com>

ENV         DEBIAN_FRONTEND noninteractive

RUN         sed -i -e 's/ main/ main non-free/' /etc/apt/sources.list
RUN         apt-get update && \
            apt-get upgrade -y && \

            apt-get install -y --no-install-recommends apache2 libapache2-mod-fastcgi && \

            apt-get clean && \
            apt-get autoremove -y && \
            rm -Rf /var/lib/apt/lists/* /usr/share/man/* /usr/share/doc/*


COPY        vhost.conf /etc/apache2/sites-available/vhost
RUN         a2enmod actions fastcgi rewrite && \
            a2dissite default && \
            a2ensite vhost && \
            mkdir /var/lib/php-fcgi


RUN         chmod 644 /var/log/apache2

ENV         APACHE_UID 33
ENV         APACHE_GID 33

EXPOSE      80

COPY        run.sh     /run.sh
RUN         chmod u+x  /run.sh

CMD         ["/run.sh"]
