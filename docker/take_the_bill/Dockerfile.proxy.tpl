FROM ubuntu:latest

LABEL version="1.0"
LABEL maintainer="Hive Solutions <development@hive.pt>"

ENV HOME /

ENV OMNI_DOMAIN {{ OMNI_DOMAIN }}
ENV OMNI_HOST {{ OMNI_HOST }}
ENV OMNI_HOST {{ OMNI_HOST }}
ENV TTB_DOMAIN {{ TTB_DOMAIN }}
ENV TTB_HOST {{ TTB_HOST }}
ENV TTB_PORT {{ TTB_PORT }}

ADD proxy.py /proxy.py

RUN apt-get update && apt-get install -y -q python python-setuptools wget
RUN pip install netius

ENTRYPOINT ["usr/bin/python", "proxy.py"]
