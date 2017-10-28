#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GREEN='\033[0;32m'
BLACK='\033[0m'

printf "${GREEN}Installing dependencies${BLACK}\n"

/usr/bin/apt update -y
/usr/bin/apt install -y lib32stdc++6 \
		        lib32tinfo5 \
                        lib32ncurses5 \
                        libcurl3-gnutls:i386

printf "${GREEN}Downloading SteamCMD${BLACK}\n"

$DIR/SteamCMD/download.sh

printf "${GREEN}Starting SteamCMD${BLACK}\n"

printf "${GREEN}Please log into a Steam account which owns the games you wish to host${BLACK}\n"

printf "${GREEN}Username:${BLACK}\n"
read STEAM_USERNAME

$DIR/SteamCMD/steamcmd.sh +login "$STEAM_USERNAME" +quit

printf "${GREEN}Installation complete!${BLACK}\n"
