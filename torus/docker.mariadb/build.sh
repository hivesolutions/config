#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

MARIADB_HOST=${MARIADB_HOST-172.17.42.1}
MARIADB_PORT=${MARIADB_PORT-3306}
MARIADB_USERNAME=${MARIADB_USERNAME-admin}
MARIADB_PASSWORD=${MARIADB_PASSWORD-admin}

mkdir mariadb && cd mariadb
wget https://github.com/hivesolutions/config/raw/master/docker/mariadb/Dockerfile.tpl
context Dockerfile.tpl > Dockerfile && rm Dockerfile.tpl
docker pull ubuntu && docker build --no-cache -t self/mariadb .
cd .. && rm -rf mariadb

docker run --name mariadb -p $MARIADB_HOST:$MARIADB_PORT:$MARIADB_PORT -v /data:/data -i -t -d self/mariadb
