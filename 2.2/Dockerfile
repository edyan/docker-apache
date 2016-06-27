FROM debian:wheezy

ENV PHP_GID 1000

RUN sed -i -e 's/ main/ main non-free/' /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apache2 \
       libapache2-mod-fastcgi \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*


COPY vhost.conf /etc/apache2/sites-available/vhost

RUN a2enmod actions fastcgi rewrite \
    && a2dissite default && a2ensite vhost \
    && mkdir /var/lib/php5-fcgi

RUN groupadd -g $PHP_GID php && \
    usermod -a -G php www-data

COPY ./run.sh /run.sh

RUN chmod 644 /var/log/apache2

ENV FPM_GID 1000

EXPOSE 80
CMD ["/run.sh"]
