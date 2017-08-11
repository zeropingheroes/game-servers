#!/bin/bash

server/srcds_run -console -authkey EC5F82F81D15A10CBC71F8B87F180F9A +host_workshop_collection 481591406 +exec server-zph.cfg -game garrysmod +sv_lan 1 -maxplayers 32 +gamemode prop_hunt +map ph_office
