# docker-spideroak
A container running [SpiderOakONE](https://spideroak.com/one/).
Configuration for this container should be built by a CM tool as the
mounted volumnes must match what is specified in `config/volumes` (see
below).

**THIS CONTAINER IS NO LONGER MAINTAINED**

# Usage

## docker

```
docker create \
  --name=monit \
  --network host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -v </path/to/appdata/config>:/config \
  -v </home/YOU>:</home/YOU> \
  -v </path/to/backup1>:</path/to/backup1> \
  -v </path/to/backup2>:</path/to/backup2> \
  -v </path/to/backup3>:</path/to/backup3> \
  ...
  -v </path/to/backupN>:</path/to/backupN> \
  --restart unless-stopped \
  jchonig/spideroakone
```

### docker-compose

Compatible with docker-compose v3 schemas.

```
---
version: "3"
services:
  spideroakone:
    image: jchonig/spideroakone
    container_name: spideroakone
	network_mode: host
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - </path/to/appdata/config>:/config
      - </home/YOU>:</home/YOU> \
	  - </path/to/backup1>:/<path_to_backup1>
	  - </path/to/backup2>:/<path_to_backup2>
	  - </path/to/backup3>:/<path_to_backup3>
	  ...
	  - </path/to/backupN>:/<path_to_backupN>
    restart: unless-stopped
```

# Parameters

## Environment Variables (-e)

| Env       | Function                                             |
| ---       | --------                                             |
| PUID=1000 | for UserID - Set to UID that will run SpiderOak ONE  |
| PGID=1000 | for GroupID - Set to GID that will run SpiderOak ONE |
| TZ=UTC    | Specify a timezone to use EG UTC                     |
| HOME      | Set to your home directory                           |
|           |                                                      |

## Volume Mappings (-v)

| Volume           | Function            |
| ------           | --------            |
| /config          | Configuration data  |
| /home/YOU        | Your home directory |
| /path/to/backup1 | Volume to back up   |
| /path/to/backup2 | Volume to back up   |
| /path/to/backup3 | Volume to back up   |
| /path/to/backup4 | Volume to back up   |

# Application Setup

  * The file `/config/volumes` should contain an operative specified
    by a path.  The operatives are `include-dir`, `include-file`,
    `exclude-dir`, `exclude-file`, and `purge`.  For the `include-*` operatives,
    the target must be mounted to the container.
  * `username`, `password`, `device_name` and optionally `reinstall`
    must be provided in `/config/setup.json` on at least the first
    run.
  * Set HOME to your home directory and mount it to the container.
    SpiderOakONE will create the `SpiderOak Hive` directory for you.
    If you do not set HOME, SpiderOakONE will use `/config` as your
    home directory.
  * Use host network to enable LAN Sync.

## REFERENCE
  * [SpiderOak ONE CLI](https://spideroak.support/hc/en-us/articles/115001891343-Command-Line-Reference)

### CREDIT
  * [Andrew Lawrence SpiderOak ONE container](https://bitbucket.org/alaw005/docker-spideroak/src/master)
  * [Johan Stenqvist SpiderOak ONE container](https://github.com/neochrome/docker-spideroak)

