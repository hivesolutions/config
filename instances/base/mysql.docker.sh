#!/bin/bash
# -*- coding: utf-8 -*-

mkdir mysql && cd mysql
wget https://github.com/hivesolutions/config/raw/master/docker/mysql/Dockerfile -O Dockerfile
docker build --no-cache -t self/mysql .
cd .. && rm -rf mysql
