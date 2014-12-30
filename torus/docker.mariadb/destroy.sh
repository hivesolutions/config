#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

docker stop mariadb
docker rm mariadb
docker rmi self/mariadb
