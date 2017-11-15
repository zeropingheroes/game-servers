#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../server/Binaries/Linux && ./UDKGameServer-Linux aocffa-moor_p\?steamsockets\?port=7777\?queryport=27015 -configsubdir=ZPH -seekfreeloadingserver
