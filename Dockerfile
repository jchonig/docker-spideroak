FROM lsiobase/ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=true
ARG spideroakone_version

ENV \
        SPIDEROAK_APT_KEY=573E3D1C51AE1B3D \
	TZ=UTC

WORKDIR /tmp

COPY sources.list.d /etc/apt/sources.list.d/

# Set up
RUN \
    echo "*** install SpiderOak Repo ***" && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ${SPIDEROAK_APT_KEY} && \
    echo "**** install packages ****" && \
	apt-get update && \
	apt-get -y -o Dpkg::Options::="--force-confnew" install spideroakone=${spideroakone_version} && \
    echo "**** clean up ****" && \
	apt-get clean && \
        apt-get autoremove && \
	rm -rf /var/lib/apt/lists/*

COPY root /

VOLUME ["/root/SpiderOak Hive/", "/root/.config/SpiderOakONE"]


