FROM debian:jessie-slim
MAINTAINER Emmanuel Dyan <emmanueldyan@gmail.com>


RUN sed -i -e 's/ main/ main non-free/' /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \

    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apache2 libapache2-mod-fastcgi && \

    DEBIAN_FRONTEND=noninteractive apt-get clean && \
    DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
    rm -Rf /var/lib/apt/lists/* /usr/share/man/* /usr/share/doc/*


COPY vhost.conf /etc/apache2/sites-available/vhost.conf
RUN  a2enmod actions fastcgi rewrite && \
     a2dissite 000-default.conf && \
     a2ensite vhost.conf && \
     mkdir /var/lib/php-fcgi


RUN chmod 644 /var/log/apache2

ENV APACHE_UID 33
ENV APACHE_GID 33

EXPOSE 80

COPY run.sh     /run.sh
RUN  chmod u+x  /run.sh

CMD ["/run.sh"]
