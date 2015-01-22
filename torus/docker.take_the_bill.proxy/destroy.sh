#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

docker stop take_the_bill.proxy
docker rm take_the_bill.proxy
docker rmi self/take_the_bill.proxy
