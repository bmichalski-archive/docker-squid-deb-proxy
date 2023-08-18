#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

SQUID_DEB_PROXY_EXISTS=`docker inspect --format="{{ .Id }}" squid-deb-proxy 2> /dev/null`
SQUID_DEB_PROXY_DATA_EXISTS=`docker inspect --format="{{ .Id }}" squid-deb-proxy-data 2> /dev/null`

if [ -z "$SQUID_DEB_PROXY_DATA_EXISTS" ]
then
  docker run -d -v /var/cache/squid-deb-proxy -v /var/log/squid-deb-proxy --name squid-deb-proxy-data ubuntu:14.04
fi

if ! [ -z "$SQUID_DEB_PROXY_EXISTS" ]
then
  docker kill squid-deb-proxy
  docker rm squid-deb-proxy
fi
