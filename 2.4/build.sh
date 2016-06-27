#!/bin/bash
docker build -t "inetprocess:testapache24" .
docker run -e "PHP_GID=1000" inetprocess:testapache24
