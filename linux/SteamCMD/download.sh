#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

URL="http://media.steampowered.com/client/steamcmd_linux.tar.gz"

cd $DIR && /usr/bin/curl -sqL $URL | tar zxvf -
