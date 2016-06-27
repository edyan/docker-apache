FROM debian:jessie
MAINTAINER Emmanuel Dyan <emmanuel.dyan@inetprocess.com>

RUN sed -i -e 's/ main/ main non-free/' /etc/apt/sources.list
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apache2 libapache2-mod-fastcgi && \
    apt-get clean && \
    rm -Rf /var/lib/apt/lists/* && \
    rm -Rf /usr/share/man/* /usr/share/doc/*

COPY vhost.conf /etc/apache2/sites-available/vhost.conf

RUN a2enmod actions fastcgi rewrite && \
    a2dissite 000-default.conf && \
    a2ensite vhost.conf && \
    mkdir /var/lib/php5-fcgi

RUN groupadd php && \
    usermod -a -G php www-data

RUN chmod 644 /var/log/apache2

ENV PHP_GID 1000

EXPOSE 80

COPY run.sh     /run.sh
RUN  chmod u+x  /run.sh

CMD ["/run.sh"]
