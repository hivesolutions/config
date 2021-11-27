FROM ubuntu:latest

LABEL version="1.0"
LABEL maintainer="Hive Solutions <development@hive.pt>"

ENV HOME /
ENV HOST 0.0.0.0
ENV PREFIX /mvc
ENV ALIAS_PATH /.colony/meta/omni_assets_config/extra/alias.json

ENV SERVER {{ SERVER }}
ENV PORT {{ OMNI_PORT }}
ENV SSL {{ OMNI_SSL }}
ENV SERVER_ENCODING {{ SERVER_ENCODING }}
ENV RUN_MODE {{ RUN_MODE }}
ENV REPO_USERNAME {{ REPO_USERNAME }}
ENV REPO_PASSWORD {{ REPO_PASSWORD }}
ENV DB_ENGINE {{ DB_ENGINE }}
ENV DB_HOST {{ DB_HOST }}
ENV DB_NAME {{ DB_NAME }}
ENV DB_USER {{ DB_USER }}
ENV DB_PASSWORD {{ DB_PASSWORD }}
ENV BUILD_SCHEMA {{ BUILD_SCHEMA }}
ENV REDISTOGO_URL {{ REDISTOGO_URL }}
ENV FS {{ FS }}
ENV SESSION_PATH {{ SESSION_PATH }}

ADD colony.json /colony.json

RUN apt-get update && apt-get install -y -q python python-pip python-setuptools wget rsync \
    python-dev libmysqlclient-dev libjpeg-dev libfreetype6-dev zlib1g-dev libpng12-dev libffi-dev \
    libssl-dev
RUN pip install colony mysql-python redis pillow reportlab qrcode pycrypto pytz pushi netius
RUN wget https://github.com/hivesolutions/config/raw/master/colony/base.txt && \
    wget https://github.com/hivesolutions/config/raw/master/colony/omni.txt
RUN cpm require base.txt omni.txt && rm base.txt omni.txt
RUN rsync -a .colony/meta/omni_assets_config/ .colony/ && rm .colony/spec.json
RUN mkdir -p usr/share/fonts/truetype
RUN cp .colony/meta/omni_assets_config/extra/fonts/*/* usr/share/fonts/truetype
RUN ln -s /data/fs .colony/meta/pt.hive.colony.plugins.data.file.fs

ENTRYPOINT ["usr/local/bin/colony_wsgi"]
