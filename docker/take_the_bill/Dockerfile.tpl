FROM ubuntu:latest
MAINTAINER Hive Solutions

ENV HOME /

ENV SECRET {{ SECRET }}

RUN apt-get update && apt-get install -y -q python python-setuptools wget rsync python-dev
RUN easy_install pip && pip install flask quorum xhtml2pdf omni_api netius
RUN pip install take_the_bill --extra-index-url https://pypi.fury.io/$SECRET/hivesolutions/

ENTRYPOINT ["usr/local/bin/colony"]
