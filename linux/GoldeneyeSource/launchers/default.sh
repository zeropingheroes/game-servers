#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# "-exec server-zph.cfg" does not work on command line
# so instead add "exec" command to server.cfg
rm "$DIR/server/gesource/cfg/server.cfg"
echo "exec server-zph.cfg" > "$DIR/server/gesource/cfg/server.cfg"

cd $DIR/../server && MALLOC_CHECK_=0 ./srcds_run -console -game ./gesource +sv_lan 1 +map ge_facility_backzone +maxplayers 16
