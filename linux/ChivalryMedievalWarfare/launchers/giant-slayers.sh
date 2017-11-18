#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Clear the cached config directory
rm -r ~/.local/share/TornBanner

cd $DIR/../server/Binaries/Linux && ./UDKGameServer-Linux AOCFFA-StoneshillVillage_P\?modname=giantslayers\?steamsockets\?port=7777\?queryport=27015 -configsubdir=ZPH -seekfreeloadingserver -sdkfileid=226726898
