FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get install -y \
    squid-deb-proxy \
    avahi-utils

COPY conf/root/on-startup.sh /root/on-startup.sh

RUN chmod u+x /root/on-startup.sh

ENV HOME /root

WORKDIR /root

CMD bash 
