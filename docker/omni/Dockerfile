FROM ubuntu:latest
MAINTAINER Hive Solutions

ADD colony.json /colony.json

VOLUME /data:/data

RUN apt-get update
RUN apt-get install -y -q python python-setuptools wget rsync
RUN apt-get install -y -q python-dev libmysqlclient-dev libjpeg-dev libfreetype6-dev zlib1g-dev libpng12-dev
RUN easy_install pip && pip install colony mysql-python pillow reportlab crypto pytz pushi netius
RUN wget https://github.com/hivesolutions/config/raw/master/colony/base.txt
RUN wget https://github.com/hivesolutions/config/raw/master/colony/omni.txt
RUN cpm require base.txt && cpm require omni.txt
RUN rm base.txt && rm omni.txt
run rsync -a ~/.colony/meta/omni_assets_config/ ~/.colony/ && rm ~/.colony/spec.json
RUN mkdir -p /usr/share/fonts/truetype/calibri && cp ~/.colony/meta/omni_assets_config/extra/fonts/calibri/* /usr/share/fonts/truetype/calibri
RUN rm -f Dockerfile

ENTRYPOINT source /data/omni.env && usr/local/bin/colony
