FROM ubuntu:latest
MAINTAINER Hive Solutions

ENV HOME /

ENV SERVER {{ SERVER }}
ENV HOST {{ TTB_HOST }}
ENV PORT {{ TTB_PORT }}
ENV SSL {{ TTB_SSL }}
ENV SERVER_ENCODING {{ SERVER_ENCODING }}
ENV OMNI_URL {{ OMNI_URL }}
ENV OMNI_OPEN_URL {{ OMNI_OPEN_URL }}
ENV SECRET {{ SECRET }}

RUN apt-get update && apt-get install -y -q python python-setuptools wget rsync python-dev
RUN easy_install pip && pip install flask quorum xhtml2pdf omni_api netius
RUN pip install ttb --extra-index-url https://pypi.fury.io/{{ SECRET }}/hivesolutions/

ENTRYPOINT ["usr/bin/python", "-m", "take_the_bill.main"]
