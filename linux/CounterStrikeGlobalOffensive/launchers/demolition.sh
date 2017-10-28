#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../ && server/srcds_run -console -game csgo +exec server-zph.cfg +sv_lan 1 +game_type 1 +game_mode 1 +mapgroup mg_demolition +map de_lake
