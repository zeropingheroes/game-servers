#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../ && server/srcds_run -console -game garrysmod +sv_lan 1 -maxplayers 32 +host_workshop_collection 481591406 +gamemode prop_hunt +exec zph-prophunt-hidenseek.cfg +map ph_westerncity
