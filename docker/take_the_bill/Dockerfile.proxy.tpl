FROM ubuntu:latest
MAINTAINER Hive Solutions

ENV HOME /

ADD proxy.py /proxy.py

RUN apt-get update && apt-get install -y -q python python-setuptools wget
RUN easy_install pip && pip install netius
RUN wget https://github.com/hivesolutions/config/raw/master/take_the_bill/proxy.py.tpl
context proxy.py.tpl > proxy.py && rm proxy.py.tpl

ENTRYPOINT ["usr/bin/python", "proxy.py"]
