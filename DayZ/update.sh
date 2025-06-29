#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../functions.sh

update_steam_game 223350 $DIR $STEAMCMD_USERNAME
