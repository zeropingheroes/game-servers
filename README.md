# game-servers
Game server configs, launchers and downloaders for our LAN parties

## Linux

### Installation

1. `cd /srv/ && git clone https://github.com/zeropingheroes/game-servers.git`

2. `apt update -y && apt install -y lib32stdc++6 lib32tinfo5 lib32ncurses5 libcurl3-gnutls:i386 unzip`

3. `/srv/game-servers/install.sh`

### Usage

Install the game server: `/srv/game-servers/game-servers install *game*`

Update the game server: `/srv/game-servers/game-servers update *game*`

Launch the game server: `/srv/game-servers/game-servers launch *game*`

Open the game server's console: `/srv/game-servers/game-servers console *game*`

Substitute *`game`* for one of the included folders e.g. `Teeworlds`

## Windows

...
