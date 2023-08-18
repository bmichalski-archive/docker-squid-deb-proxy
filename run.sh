#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

"$DIR/common-run.sh"

docker run \
  -p 8000:8000 \
  --volumes-from squid-deb-proxy-data \
  --name squid-deb-proxy \
  -d bmichalski/squid-deb-proxy \
  bash -c "/root/on-startup.sh &&
  tail -f /var/log/squid-deb-proxy/{access,cache,store}.log"
