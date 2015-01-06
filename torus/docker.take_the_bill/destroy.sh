#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

docker stop take_the_bill
docker rm take_the_bill
docker rmi self/take_the_bill
