#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

REDIS_HOST=${REDIS_HOST-172.17.42.1}
REDIS_PORT=${REDIS_PORT-6379}

mkdir redis && cd redis
wget https://github.com/hivesolutions/config/raw/master/docker/redis/Dockerfile
docker build --no-cache -t self/redis .
cd .. && rm -rf redis

docker run --name redis -p $REDIS_HOST:$REDIS_PORT:$REDIS_PORT -v /data:/data -i -t -d self/redis
