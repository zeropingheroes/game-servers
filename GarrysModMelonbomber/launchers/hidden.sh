#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../ && server/srcds_run -console -game garrysmod +sv_lan 0 -maxplayers 32 +host_workshop_collection 3511273533 +gamemode thehiddenirisedition +map hdn_docks
