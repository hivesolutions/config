#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

docker stop proxy
docker rm proxy
docker rmi self/take_the_bill.proxy
