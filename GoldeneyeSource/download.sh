#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

curl -L "http://files.gameservermanagers.com/GoldenEyeSource/GoldenEye_Source_v5.0.1_full_server_linux.tar.bz2" | tar -xj -C "$SCRIPTPATH/server"
