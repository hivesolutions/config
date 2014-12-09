FROM ubuntu:latest
MAINTAINER Hive Solutions

ADD colony.json /colony.json

RUN apt-get update && apt-get install -y -q python python-setuptools wget rsync python-dev \
libmysqlclient-dev libjpeg-dev libfreetype6-dev zlib1g-dev libpng12-dev
RUN easy_install pip && pip install colony mysql-python redis pillow reportlab pycrypto pytz pushi netius
RUN wget https://github.com/hivesolutions/config/raw/master/colony/base.txt && \
wget https://github.com/hivesolutions/config/raw/master/colony/omni.txt
RUN cpm require base.txt omni.txt && rm base.txt omni.txt
run rsync -a .colony/meta/omni_assets_config/ .colony/ && rm .colony/spec.json
RUN mkdir -p usr/share/fonts/truetype/calibri && cp .colony/meta/omni_assets_config/extra/fonts/calibri/* usr/share/fonts/truetype/calibri
RUN ln -s /data/fs .colony/meta/pt.hive.colony.plugins.data.file.fs

CMD ["usr/local/bin/colony"]
ENTRYPOINT ["data/exec"]
