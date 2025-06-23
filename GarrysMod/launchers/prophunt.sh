#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../ && server/srcds_run -console -game garrysmod +sv_lan 1 -maxplayers 32 +host_workshop_collection 3507201149 +gamemode prop_hunt +exec zph-prophunt.cfg +map ph_restaurant
