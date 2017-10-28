#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../ && server/srcds_run -console -game tf +exec server-zph.cfg +sv_lan 1 +map koth_sawmill +maxplayers 24
