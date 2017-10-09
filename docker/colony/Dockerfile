FROM ubuntu:latest

LABEL maintainer="Hive Solutions <development@hive.pt>"

ENV HOME /

RUN apt-get update && apt-get install -y -q python python-setuptools wget
RUN easy_install pip && pip install colony
RUN wget https://github.com/hivesolutions/config/raw/master/colony/base.txt
RUN cpm require base.txt && rm base.txt

CMD ["usr/local/bin/colony"]
