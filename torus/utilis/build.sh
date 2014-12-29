#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

apt-get update
apt-get -y install python-pip
pip install --upgrade utilis
