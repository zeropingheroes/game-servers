#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/server/System/ && ./ucc-bin server ONS-Torlan?game=Onslaught.ONSOnslaughtGame?AdminName=$USER?AdminPassword=admin  -nohomedir ini=server-zph.ini
