#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

../../steamcmd/steamcmd.sh +login anonymous +force_install_dir "$SCRIPTPATH/server" +app_update 232250 validate +quit
