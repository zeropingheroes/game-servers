#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR && cd server && MALLOC_CHECK_=0 ./srcds_run -console -game ./gesource +exec server-zph.cfg +sv_lan 1 -ip 0.0.0.0 +map ge_facility_backzone +maxplayers 16
