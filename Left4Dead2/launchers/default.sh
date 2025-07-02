#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../ && server/srcds_run -game left4dead2 +sv_lan 1 +map c1m1_hotel
