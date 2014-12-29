#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

docker stop redis
docker rm redis
docker rmi self/redis
