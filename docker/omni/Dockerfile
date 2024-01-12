FROM ubuntu:bionic

LABEL version="1.0"
LABEL maintainer="Hive Solutions <development@hive.pt>"

ENV HOME /

ADD colony.json /colony.json

RUN apt-get update && apt-get install -y -q gcc python python-pip python-setuptools wget rsync\
    python-dev libmysqlclient-dev libjpeg-dev libfreetype6-dev zlib1g-dev libpng-dev libffi-dev\
    libssl-dev libcairo2-dev
RUN pip install colony mysql-python redis kafka-python pillow reportlab qrcode pycrypto pytz pushi\
    netius "elasticsearch<8"
RUN wget https://github.com/hivesolutions/config/raw/master/colony/base.txt &&\
    wget https://github.com/hivesolutions/config/raw/master/colony/omni.txt
RUN cpm require base.txt omni.txt && rm base.txt omni.txt
RUN rsync -a .colony/meta/omni_assets_config/ .colony/ && rm .colony/spec.json
RUN mkdir -p /usr/share/fonts/truetype
RUN cp -rp .colony/meta/omni_assets_config/extra/fonts/*/* /usr/share/fonts/truetype
RUN mkdir -p /data/fs && ln -s /data/fs .colony/meta/pt.hive.colony.plugins.data.file.fs

CMD ["usr/local/bin/colony"]
ENTRYPOINT ["data/exec"]
