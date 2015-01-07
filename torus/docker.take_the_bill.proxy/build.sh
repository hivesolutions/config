#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

OMNI_DOMAIN=${OMNI_DOMAIN-omni.host}
OMNI_HOST=${OMNI_HOST-172.17.42.1}
OMNI_PORT=${OMNI_PORT-8080}
TTB_DOMAIN=${TTB_DOMAIN-ttb.host}
TTB_HOST=${TTB_HOST-172.17.42.1}
TTB_PORT=${TTB_PORT-8181}

mkdir take_the_bill.proxy && cd take_the_bill.proxy
wget https://github.com/hivesolutions/config/raw/master/docker/redis/Dockerfile.proxy.tpl -O Dockerfile.tpl
context Dockerfile.tpl > Dockerfile && rm Dockerfile.tpl
docker build --no-cache -t self/take_the_bill.proxy .
cd .. && rm -rf take_the_bill.proxy

docker run \
--name proxy \
-e HOST=0.0.0.0 \
-e PORT=443 \
-e SSL=1 \
-p 0.0.0.0:443:443 \
-v /data:/data \
-i -t self/take_the_bill.proxy
