#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/../server && ./q3ded +set fs_homepath "$DIR/server" +set fs_game osp +set dedicated 1 +set net_port 27960 +exec "server-zph.cfg"
