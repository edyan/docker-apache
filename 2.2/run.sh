#!/bin/sh
groupmod -g $PHP_GID php
exec /usr/sbin/apache2ctl -D FOREGROUND
