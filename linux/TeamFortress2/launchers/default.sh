#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../ && server/srcds_run -game tf +sv_lan 1 +exec server-zph.cfg
