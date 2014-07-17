#!/bin/bash
# -*- coding: utf-8 -*-

apt-get update
apt-get install -y -q python python-setuptools wget rsync
apt-get install -y -q python-dev libmysqlclient-dev libjpeg-dev libfreetype6-dev zlib1g-dev libpng12-dev
easy_install pip && pip install colony mysql-python redis pillow reportlab pycrypto pytz pushi netius
wget https://github.com/hivesolutions/config/raw/master/colony/base.txt
wget https://github.com/hivesolutions/config/raw/master/colony/omni.txt
cpm require base.txt && cpm require omni.txt
rm base.txt && rm omni.txt
rsync -a .colony/meta/omni_assets_config/ .colony/ && rm .colony/spec.json
mkdir -p usr/share/fonts/truetype/calibri && cp .colony/meta/omni_assets_config/extra/fonts/calibri/* usr/share/fonts/truetype/calibri
ln -s /data/fs .colony/meta/pt.hive.colony.plugins.data.file.fs
rm -f Dockerfile
