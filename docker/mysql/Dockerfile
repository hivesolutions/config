FROM ubuntu:bionic

LABEL version="1.0"
LABEL maintainer="Hive Solutions <development@hive.pt>"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q mysql-server pwgen wget
RUN wget https://github.com/hivesolutions/config/raw/master/mysql/my.cnf.small -O my.cnf &&\
    wget https://github.com/hivesolutions/config/raw/master/mysql/init.sh &&\
    wget https://github.com/hivesolutions/config/raw/master/mysql/mysqld_link
RUN chmod 755 mysqld_link && chmod 755 *.sh
RUN cp -R my.cnf etc/mysql/my.cnf && rm my.cnf
RUN ./init.sh && rm init.sh

ENTRYPOINT ["./mysqld_link"]
