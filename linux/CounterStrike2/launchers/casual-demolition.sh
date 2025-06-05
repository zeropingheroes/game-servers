#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../ && server/game/bin/linuxsteamrt64/cs2 -dedicated -console +exec zph-casual-demolition.cfg
