FROM ubuntu:latest

LABEL version="1.0"
LABEL maintainer="Hive Solutions <development@hive.pt>"

ENV HOME /

RUN apt-get update && apt-get install -y -q python python-pip python-setuptools wget
RUN pip install colony
RUN wget https://github.com/hivesolutions/config/raw/master/colony/base.txt
RUN cpm require base.txt && rm base.txt

CMD ["usr/local/bin/colony"]
