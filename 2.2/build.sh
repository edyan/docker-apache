#!/bin/bash
docker build -t "inetprocess:testapache22" .
docker run -e "PHP_GID=1000" inetprocess:testapache22
