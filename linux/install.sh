#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/globals

printf "${GREEN}Downloading SteamCMD${BLACK}\n"

$DIR/SteamCMD/download.sh

printf "${GREEN}Starting SteamCMD${BLACK}\n"

printf "${GREEN}Please log into a Steam account which owns the games you wish to host${BLACK}\n"

printf "${GREEN}Username:${BLACK}\n"
read STEAM_USERNAME

$DIR/SteamCMD/steamcmd.sh +login $STEAM_USERNAME +quit

printf "${GREEN}Installation complete!${BLACK}\n"
