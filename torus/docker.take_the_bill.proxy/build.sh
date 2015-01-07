#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

REDIS_HOST=${REDIS_HOST-172.17.42.1}
REDIS_PORT=${REDIS_PORT-6379}

mkdir take_the_bill.proxy && cd take_the_bill.proxy
wget https://github.com/hivesolutions/config/raw/master/docker/redis/Dockerfile.proxy.tpl -O Dockerfile.tpl
docker build --no-cache -t self/take_the_bill.proxy .
cd .. && rm -rf take_the_bill.proxy

docker run --name redis -p $REDIS_HOST:$REDIS_PORT:$REDIS_PORT -v /data:/data -i -t -d self/redis
