#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

docker stop omni
docker rm omni
docker rmi self/omni
