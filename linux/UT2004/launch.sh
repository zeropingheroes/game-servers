#!/bin/bash

echo "Please enter your password:"
read -s UNREALADMINPASS

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR && cd server/System/ && ./ucc-bin server ONS-Torlan?game=Onslaught.ONSOnslaughtGame?AdminName=$USER?AdminPassword=$UNREALADMINPASS  -nohomedir ini=server-zph.ini
