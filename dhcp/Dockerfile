FROM hivesolutions/alpine:latest
MAINTAINER Hive Solutions

EXPOSE 67/udp

ADD dhcpd.conf /etc/dhcp/config/dhcp/dhcpd.conf
ADD hive.conf /etc/dhcp/config/dhcp/hive.conf

WORKDIR /etc/dhcp

RUN apk update && apk add dhcp
RUN ln -s /etc/dhcp/config/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf
RUN touch /var/lib/dhcp/dhcpd.leases

CMD ["/usr/sbin/dhcpd", "-f", "-cf", "/etc/dhcp/dhcpd.conf"]
