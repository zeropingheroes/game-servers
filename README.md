# game-servers
Game server configs, launchers and downloaders for our LAN parties

## Linux

### Installation

1. `cd /srv/ && git clone https://github.com/zeropingheroes/game-servers.git`

2. `cd /srv/game-servers/SteamCMD/linux`

3. `./download.sh`

4. `./steamcmd.sh +login your-username-here +quit`

### Usage

There is a directory for each game server. In each there are a combination of these shell scripts:

**`update.sh`** - Update the game server, usually using SteamCMD

**`download.sh`** - Download the game server, probably from a HTTP URL

**`link-configs.sh`** - Create symbolic links from the game server's `configs` directory included with this repo, to the correct location in the (installed) game server's folder. 

**`launch-*.sh`** - Launch the game server. Typically there are multiple scripts, each launching a different game type for example

## Windows

### Installation

### Usage
