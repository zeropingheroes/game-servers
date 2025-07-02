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
echo_info "To control the server:"
echo_info "1. Connect as a player"
echo_info "2. Press the apostrophe (') key"
echo_info "3. Type \"adminlogin <your password>\""
echo ""
echo_info "Then use the following commands:"
echo ""
echo "Admin MapList                               List maps available on the server"
echo "AdminChangeMap <map name>                   Change map"
echo "AdminRestartMap                             Restart map"
echo "Admin GetInfo                               List connected players"
echo "AdminChangeTeam <player name>               Swap player to opposite team"
echo "AdminKick <player name>                     Kick player from server"
echo "AdminKickBan <player name>                  Kick and ban player from server"
echo "AdminChangeTeamDamageAmount <0.0 to 1.0>    Set team damage multiplier"
echo "AdminCancelVote                             Cancel current vote"
echo "Admin Aoc_EndGame                           End current map"
echo "Admin AddBots <number>                      Add bots"
echo "Admin Killbots                              Kick all bots"
echo "Admin Aoc_ShowDamage 1                      Print damage to console"
echo "AdminForceVoiceMute <player name>           Mute player voice chat"
echo "AdminForceVoiceUnmute <player name>         Unmute player voice chat"
echo "AdminForceTextMute <player name>            Mute player text chat"
echo "AdminForceTextUnmute <player name>          Unmute player text chat"
echo "Admin Aoc_Slowmo <0.001 to 2.0>             Set game speed multiplier"
echo "Admin Pause                                 Pause server (if enabled)"
echo "AdminLogout                                 Log out of admin"
echo ""
echo_info "You must log in again after each map change."
echo_info "For convenience, bind a key to logging in as admin, for example:"
echo ""
echo_info "Setbind O AdminLogin <your password>"
echo
echo "---------------------------------------------------------------------------------------"
echo

# Clear the cached config directory
rm -rf ~/.local/share/TornBanner

cd $DIR/../server/Binaries/Linux && ./UDKGameServer-Linux "AOCFFA-DiningHall_P ?steamsockets -port=7777 -queryport=27015 -seekfreeloadingserver -configsubdir=ZPH"
