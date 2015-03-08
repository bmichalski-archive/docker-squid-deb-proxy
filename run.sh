#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

#$DIR/common-run.sh

docker run -p 3128:3128 --rm --name squid -it bmichalski/squid
