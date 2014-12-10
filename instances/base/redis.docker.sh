#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

mkdir redis && cd redis
wget https://github.com/hivesolutions/config/raw/master/docker/omni/Dockerfile.redis -O Dockerfile
docker build --no-cache -t self/redis .
cd .. && rm -rf redis
