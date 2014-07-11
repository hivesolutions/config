#!/bin/bash
# -*- coding: utf-8 -*-

if [ ! -d /data/mysql ]; then  
    mkdir /data/mysql
    cp -rp /var/lib/mysql/* /data/mysql
fi

rm -rf /var/lib/mysql
ln -s /data/mysql /var/lib/mysql
