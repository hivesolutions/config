#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

mkdir mysql && cd mysql
wget https://github.com/hivesolutions/config/raw/master/docker/mysql/Dockerfile -O Dockerfile
docker pull ubuntu && docker build --no-cache -t self/mysql .
cd .. && rm -rf mysql
