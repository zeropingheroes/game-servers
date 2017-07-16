#!/bin/bash

URL="http://media.steampowered.com/client/steamcmd_linux.tar.gz"

curl -sqL $URL | tar zxvf -

apt-get install lib32stdc++6 lib32tinfo5 lib32ncurses5
