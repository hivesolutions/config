#!/bin/bash
# -*- coding: utf-8 -*-

set -e +h

SERVER=${SERVER-netius}
OMNI_HOST=${OMNI_HOST-0.0.0.0}
OMNI_PORT=${OMNI_PORT-8080}
SERVER_ENCODING=${SERVER_ENCODING-gzip}
SERVER_SSL=${SERVER_SSL-1}
RUN_MODE=${RUN_MODE-omni}
REPO_USERNAME=${REPO_USERNAME-root}
REPO_PASSWORD=${REPO_PASSWORD-root}
DB_ENGINE=${DB_ENGINE-mysql}
DB_HOST=${DB_HOST-172.17.42.1}
DB_NAME=${DB_NAME-omni}
DB_USER=${DB_USER-root}
DB_PASSWORD=${DB_PASSWORD-root}
BUILD_SCHEMA=${BUILD_SCHEMA-0}
REDISTOGO_URL=${REDISTOGO_URL-redis://172.17.42.1}
FS=${FS-/data/fs/default}
SESSION_PATH=${SESSION_PATH-/data/session}

mkdir omni && cd omni
wget https://github.com/hivesolutions/config/raw/master/docker/omni/Dockerfile.tpl -O Dockerfile.tpl
context Dockerfile.tpl > Dockerfile && rm Dockerfile.tpl
wget https://github.com/hivesolutions/config/raw/master/colony/templates/colony.json.tpl
context colony.json.tpl > colony.json && rm colony.json.tpl
docker build --no-cache -t self/omni .
cd .. && rm -rf omni

mkdir -p /data/fs

if [ "$DB_ENGINE" == "mysql" ]; then
    apt-get update
    apt-get -y install mysql-client
    mysql -u$DB_USER -p$DB_PASSWORD -h$DB_HOST -e "CREATE SCHEMA IF NOT EXISTS $DB_NAME"
fi

docker run \
--name omni \
-e HOST=0.0.0.0 \
-e PORT=$OMNI_PORT \
-e SERVER_ENCODING=$SERVER_ENCODING \
-e SERVER_SSL=$SERVER_SSL \
-e PREFIX=/mvc \
-e ALIAS_PATH=/.colony/meta/omni_assets_config/extra/alias.json \
-p $OMNI_HOST:$OMNI_PORT:$OMNI_PORT \
-v /data:/data \
-i -t -d self/omni
