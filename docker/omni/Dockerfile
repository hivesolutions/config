FROM ubuntu:latest
MAINTAINER Hive Solutions

ADD build.sh /build.sh
ADD colony.json /colony.json

RUN bin/bash build.sh && rm build.sh

CMD ["usr/local/bin/colony"]
ENTRYPOINT ["data/exec"]
