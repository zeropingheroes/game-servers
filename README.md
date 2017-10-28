# game-servers
Game server configs, launchers and downloaders for our LAN parties

## Linux

### Installation

1. `apt update -y && apt install -y lib32stdc++6 lib32tinfo5 lib32ncurses5 libcurl3-gnutls:i386 unzip`

2. `cd /srv/ && git clone https://github.com/zeropingheroes/game-servers.git && cd /srv/game-servers/`

3. `./game-servers self-install`

### Usage

    $ ./game-servers

    Usage:

      game-servers self-install
      game-servers self-update

      game-servers install <game1> [<game2>...]
      game-servers install all

      game-servers update <game1> [<game2>...]
      game-servers update all

      game-servers launch <game> [<launcher>]
      game-servers console <game> [<launcher>]
      game-servers stop <game> [<launcher>]

      game-servers status

## Windows

...
