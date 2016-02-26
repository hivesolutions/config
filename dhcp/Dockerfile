FROM hivesolutions/alpine:latest
MAINTAINER Hive Solutions

EXPOSE 67/udp

ADD dhcpd.conf /etc/dhcp/dhcpd.conf
ADD hive.conf /etc/dhcp/hive.conf

RUN apk update && apk add dhcp
RUN touch /var/lib/dhcp/dhcpd.leases

CMD ["/usr/sbin/dhcpd", "-f", "-cf", "/etc/dhcp/dhcpd.conf"]
