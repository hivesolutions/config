FROM ubuntu:latest

LABEL maintainer="Hive Solutions <development@hive.pt>"

ENV MARIADB_HOST {{ MARIADB_HOST }}
ENV MARIADB_PORT {{ MARIADB_PORT }}
ENV MARIADB_USERNAME {{ MARIADB_USERNAME }}
ENV MARIADB_PASSWORD {{ MARIADB_PASSWORD }}

ENV MYSQL_HOST {{ MARIADB_HOST }}
ENV MYSQL_PORT {{ MARIADB_PORT }}
ENV MYSQL_USERNAME {{ MARIADB_USERNAME }}
ENV MYSQL_PASSWORD {{ MARIADB_PASSWORD }}

RUN apt-get update && apt-get install -y -q software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
RUN add-apt-repository "deb http://mirrors.fe.up.pt/pub/mariadb/repo/10.0/ubuntu trusty main"
RUN apt-get update && apt-get install -y -q mariadb-server pwgen wget
RUN wget https://github.com/hivesolutions/config/raw/master/mysql/my.cnf.small -O my.cnf && \
wget https://github.com/hivesolutions/config/raw/master/mysql/init.sh && \
wget https://github.com/hivesolutions/config/raw/master/mysql/mysqld_link
RUN chmod 755 mysqld_link && chmod 755 *.sh
RUN cp -R my.cnf etc/mysql/my.cnf && rm my.cnf
RUN ./init.sh && rm init.sh

ENTRYPOINT ["./mysqld_link"]
