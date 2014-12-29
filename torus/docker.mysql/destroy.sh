#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

docker stop mysql
docker rm mysql
docker rmi self/mysql
