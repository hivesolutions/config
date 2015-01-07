#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

MYSQL_HOST=${MYSQL_HOST-172.17.42.1}
MYSQL_PORT=${MYSQL_PORT-3306}
MYSQL_USERNAME=${MYSQL_USERNAME-admin}
MYSQL_PASSWORD=${MYSQL_PASSWORD-admin}

mkdir mysql && cd mysql
wget https://github.com/hivesolutions/config/raw/master/docker/mysql/Dockerfile.tpl
context Dockerfile.tpl > Dockerfile && rm Dockerfile.tpl
docker pull ubuntu && docker build --no-cache -t self/mysql .
cd .. && rm -rf mysql

docker run --name mysql -p $MYSQL_HOST:$MYSQL_PORT:$MYSQL_PORT -v /data:/data -i -t -d self/mysql
