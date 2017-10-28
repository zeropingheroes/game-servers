#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

mkdir -p $SCRIPTPATH/server

curl -L "http://files.gameservermanagers.com/UnrealTournament2004/ut2004-server-3339-ultimate-linux.tar.bz2" | tar -xj -C "$SCRIPTPATH/server"
