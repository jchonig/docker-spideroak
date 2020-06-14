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
    restart: unless-stopped
```

# Parameters

## Ports (--expose)

| Volume | Function                                         |
| ------ | --------                                         |

## Environment Variables (-e)

| Env                  | Function                                |
| ---                  | --------                                |
| PUID=1000            | for UserID - see below for explanation  |
| PGID=1000            | for GroupID - see below for explanation |
| TZ=UTC               | Specify a timezone to use EG UTC        |

## Volume Mappings (-v)

| Volume  | Function                         |
| ------  | --------                         |
| XXX | TBD |

# Application Setup

  * Environment variables can also be passed in a file named `env` in
    the `config` directory. This file is sourced by the shell.

## TODO
  * Document adding volumes
  * Document setup
  * What to do if not configured?
  * How to pass username and password securely?
  * LANSync?

## REFERENCE
  * [SpiderOak ONE CLI](https://spideroak.support/hc/en-us/articles/115001891343-Command-Line-Reference)

### CREDIT
  * [Andrew Lawrence SpiderOak ONE container](https://bitbucket.org/alaw005/docker-spideroak/src/master)
  * [Johan Stenqvist SpiderOak ONE container](https://github.com/neochrome/docker-spideroak)

