#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

HOST=${HOST-172.17.42.1}
PORT=${PORT-6379}

mkdir redis && cd redis
wget https://github.com/hivesolutions/config/raw/master/docker/redis/Dockerfile
docker build --no-cache -t self/redis .
cd .. && rm -rf redis

docker run --name redis -p $HOST:$PORT:$PORT -v /data:/data -i -t self/redis
