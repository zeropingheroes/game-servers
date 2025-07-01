#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DIR/../../functions.sh"

echo
echo_info "The server will echo these errors, and not accept any input:"
echo
echo "[S_API FAIL] SteamAPI_Init() failed; SteamAPI_IsSteamRunning() failed."
echo "IPC function call IClientUtils::GetSteamRealm took too long"
echo "ERROR: PhysXUpdateLoader.so: cannot open shared object file: No such file or directory"
echo
echo_info "However, the server is actually running OK!"
echo
sleep 4

# Clear the cached config directory
rm -rf ~/.local/share/TornBanner

cd $DIR/../server/Binaries/Linux && ./UDKGameServer-Linux "AOCFFA-DiningHall_P ?steamsockets -port=7777 -queryport=27015 -seekfreeloadingserver -configsubdir=ZPH"
