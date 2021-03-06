#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

SERVER=${SERVER-netius}
TTB_HOST=${TTB_HOST-172.17.0.1}
TTB_PORT=${TTB_PORT-8080}
TTB_SSL=${TTB_SSL-0}
TTB_QUANTITY=${TTB_QUANTITY-0}
TTB_WEIGHT=${TTB_WEIGHT-0}
SERVER_ENCODING=${SERVER_ENCODING-1}
OMNI_URL=${OMNI_URL-http://172.17.0.1:8080/}
OMNI_OPEN_URL=${OMNI_OPEN_URL-http://172.17.0.1:8080/}
SECRET=${SECRET-secret}

mkdir take_the_bill && cd take_the_bill
wget https://github.com/hivesolutions/config/raw/master/docker/take_the_bill/Dockerfile.tpl
context Dockerfile.tpl > Dockerfile && rm Dockerfile.tpl
docker build --no-cache -t self/take_the_bill .
cd .. && rm -rf take_the_bill

docker run --name take_the_bill -p $TTB_HOST:$TTB_PORT:$TTB_PORT -v /data:/data -i -t -d self/take_the_bill
