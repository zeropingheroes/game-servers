#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../ && server/srcds_run -console -game garrysmod +sv_lan 1 -maxplayers 32 +exec "server.cfg" +host_workshop_collection "3712260808" +gamemode "prop_hunt" +map "ph_islandhouse"
