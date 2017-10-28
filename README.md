# game-servers
Game server configs, launchers and downloaders for our LAN parties

## Linux

### Installation

1. `cd /srv/ && git clone https://github.com/zeropingheroes/game-servers.git`

2. `apt update -y && apt install -y lib32stdc++6 lib32tinfo5 lib32ncurses5 libcurl3-gnutls:i386 unzip`

3. `/srv/game-servers/install.sh`

### Usage

Install the game server: `/srv/game-servers/game-servers [game] install`

Update the game server: `/srv/game-servers/game-servers [game] update`

Launch the game server: `/srv/game-servers/game-servers [game] launch`

Open the game server's console: `/srv/game-servers/game-servers [game] console`

Substitute *`[game]`* for one of the included folders, for example:

`/srv/game-servers/game-servers Teeworlds launch`

## Windows

...
