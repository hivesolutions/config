#!/bin/sh
# -*- coding: utf-8 -*-

apt-get -y install smbfs
mkdir -p /mnt/config
cat > /etc/fstab << EOF
//nas1.hive/config /mnt/config smbfs username=anonymous,password=anonymous 0 0
EOF
mount /mnt/config
ln -s /mnt/config /conf
