#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR && cd server/tw && ./teeworlds_srv -f server-zph.cfg
