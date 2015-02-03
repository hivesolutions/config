FROM ubuntu:latest
MAINTAINER Hive Solutions

ENV HOME /
ENV HOST 0.0.0.0

ENV SERVER {{ SERVER }}
ENV PORT {{ TTB_PORT }}
ENV SSL {{ TTB_SSL }}
ENV TTB_QUANTITY {{ TTB_QUANTITY }}
ENV TTB_WEIGHT {{ TTB_WEIGHT }}
ENV SERVER_ENCODING {{ SERVER_ENCODING }}
ENV OMNI_URL {{ OMNI_URL }}
ENV OMNI_OPEN_URL {{ OMNI_OPEN_URL }}
ENV SECRET {{ SECRET }}

RUN locale-gen en_US.UTF-8 pt_PT.UTF-8
RUN apt-get update && apt-get install -y -q python python-setuptools wget rsync python-dev \
libjpeg-dev libfreetype6-dev zlib1g-dev libpng12-dev
RUN easy_install pip && pip install flask quorum xhtml2pdf omni_api netius
RUN pip install ttb --extra-index-url https://pypi.fury.io/{{ SECRET }}/hivesolutions/

ENTRYPOINT ["usr/bin/python", "-m", "take_the_bill.main"]
