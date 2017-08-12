#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

cd server && ./q3ded +set fs_homepath "$SCRIPTPATH/server" +set fs_game osp +set dedicated 1 +set net_port 27960 +exec "server-zph.cfg"
