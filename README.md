# docker-spideroak
A container running [SpiderOakONE](https://spideroak.com/one/) in a container

# Usage

## docker

```
docker create \
  --name=monit \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -v </path/to/appdata/config>:/config \
  -v </path/to/backup1>:</path/to/backup1> \
  -v </path/to/backup2>:</path/to/backup2> \
  -v </path/to/backup3>:</path/to/backup3> \
  ...
  -v </path/to/backupN>:</path/to/backupN> \
  --restart unless-stopped \
  jchonig/spideroakone
```

### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  spideroakone:
    image: jchonig/spideroakone
    container_name: spideroakone
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - </path/to/appdata/config>:/config
	  - </path/to/backup1>:/<path_to_backup1>
	  - </path/to/backup2>:/<path_to_backup2>
	  - </path/to/backup3>:/<path_to_backup3>
	  ...
	  - </path/to/backupN>:/<path_to_backupN>
    restart: unless-stopped
```

# Parameters

## Environment Variables (-e)

| Env                  | Function                                |
| ---                  | --------                                |
| PUID=1000            | for UserID - see below for explanation  |
| PGID=1000            | for GroupID - see below for explanation |
| TZ=UTC               | Specify a timezone to use EG UTC        |

## Volume Mappings (-v)

| Volume           | Function           |
| ------           | --------           |
| /config          | Configuration data |
| /path/to/backup1 | Volume to back up  |
| /path/to/backup2 | Volume to back up  |
| /path/to/backup3 | Volume to back up  |
| /path/to/backup4 | Volume to back up  |

# Application Setup

  * Volumes to be backed up must be listed in the `/config/volumes`
    file, one per line
  * `username`, `password`, `device_name` and optionally `reinstall`
    must be provided in `/config/setup.json` on at least the first run.

## TODO
  * LANSync?

## REFERENCE
  * [SpiderOak ONE CLI](https://spideroak.support/hc/en-us/articles/115001891343-Command-Line-Reference)

### CREDIT
  * [Andrew Lawrence SpiderOak ONE container](https://bitbucket.org/alaw005/docker-spideroak/src/master)
  * [Johan Stenqvist SpiderOak ONE container](https://github.com/neochrome/docker-spideroak)

