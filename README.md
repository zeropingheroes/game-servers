# game-servers
Game server configs, launchers and downloaders for our LAN parties.

## Requirements

* Ubuntu 24.04

## Installation

1. Install dependencies

```bash
sudo apt update
wget https://launchpad.net/ubuntu/+source/ncurses/6.4-2/+build/25522504/+files/libtinfo5_6.4-2_i386.deb
sudo dpkg -i libtinfo5_6.4-2_i386.deb
sudo apt install unzip p7zip-full lib32z1 libbz2-1.0:i386 lib32gcc-s1 lib32stdc++6 libtinfo5:i386 libcurl3-gnutls:i386 libsdl2-2.0-0:i386
```

2. Clone the project

```bash
git clone git@github.com:zeropingheroes/game-servers
cd game-servers
```

3. Set username for SteamCMD and RCON password for servers

```bash
cp .env.example .env
nano .env
```

4. Install SteamCMD
```bash
./game-servers install SteamCMD
```

## Usage

    $ ./game-servers.sh

    Usage:

      ./game-servers.sh install SteamCMD
      ./game-servers.sh install <game1> [<game2>...]

      ./game-servers.sh update <game1> [<game2>...]
      ./game-servers.sh update all

      ./game-servers.sh remove <game1> [<game2>...]
      ./game-servers.sh remove all

      ./game-servers.sh launch <game> [<launcher>]
      ./game-servers.sh console <game> [<launcher>]
      ./game-servers.sh restart <game> [<launcher>]
      ./game-servers.sh stop <game> [<launcher>]

      ./game-servers.sh status

## Editing Config files

During installation, config files in each game server's `configs` directory are symlinked into the game server's folder, so you can edit the files in the `configs` directory, and the game server will pick up the changes, and the changes can be put into Git.

Any new files you create will need to be manually symlinked into the game server's folder.
