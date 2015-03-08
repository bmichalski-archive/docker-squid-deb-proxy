FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get install -y \
    squid

COPY conf/etc/squid3/squid.conf /etc/squid3/squid.conf
COPY conf/root/on-startup.sh /root/on-startup.sh

RUN chmod u+x /root/on-startup.sh

ENV HOME /root

WORKDIR /root

EXPOSE 3128:3128

CMD \
  bash -c "/root/on-startup.sh && bash"
