#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

docker stop self/mysql
docker rm self/mysql
docker rmi mysql
