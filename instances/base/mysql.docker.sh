#!/bin/bash
# -*- coding: utf-8 -*-

mkdir mysql && cd mysql
wget https://github.com/hivesolutions/config/raw/master/docker/omni/Dockerfile.mysql -O Dockerfile
docker build --no-cache -t self/mysql .
cd .. && rm -rf mysql
