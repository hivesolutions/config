FROM ubuntu:bionic

LABEL version="1.0"
LABEL maintainer="Hive Solutions <development@hive.pt>"

ENV HOME /

ADD colony.json /colony.json

RUN apt-get update && apt-get install -y -q python python-pip python-setuptools wget rsync\
    python-dev libmysqlclient-dev libjpeg-dev libfreetype6-dev zlib1g-dev libpng-dev
RUN pip install colony mysql-python redis kafka-python pillow reportlab pycrypto pytz pushi netius
RUN wget https://github.com/hivesolutions/config/raw/master/colony/base.txt &&\
    wget https://github.com/hivesolutions/config/raw/master/colony/omni.txt &&\
    wget https://github.com/hivesolutions/config/raw/master/colony/ustore.txt
RUN cpm require base.txt omni.txt ustore.txt && rm base.txt omni.txt ustore.txt
RUN rsync -a .colony/meta/omni_assets_config/ .colony/ && rm .colony/spec.json
RUN mkdir -p usr/share/fonts/truetype
RUN cp .colony/meta/omni_assets_config/extra/fonts/*/* usr/share/fonts/truetype
RUN mkdir -p /data/fs && ln -s /data/fs .colony/meta/pt.hive.colony.plugins.data.file.fs

CMD ["usr/local/bin/colony"]
ENTRYPOINT ["data/exec"]
