#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

HOST=${HOST-172.17.42.1}
PORT=${PORT-3306}

mkdir mysql && cd mysql
wget https://github.com/hivesolutions/config/raw/master/docker/mysql/Dockerfile -O Dockerfile
docker pull ubuntu && docker build --no-cache -t self/mysql .
cd .. && rm -rf mysql

docker run --name mysql -p $HOST:$PORT:$PORT -v /data:/data -i -t -d self/mysql
