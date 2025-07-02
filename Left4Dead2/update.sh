#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../functions.sh

update_steam_game 222860 $DIR $STEAMCMD_USERNAME
