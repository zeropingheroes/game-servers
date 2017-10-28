#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR && server/srcds_run -console -game hl2mp +exec server-zph.cfg +sv_lan 1 -ip 0.0.0.0 +map dm_lockdown +maxplayers 16
