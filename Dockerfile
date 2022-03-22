FROM lsiobase/ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

ENV \
	HOME=/config \
	TZ=UTC

# Add SpiderOakONE from tarball
RUN \
	echo "**** install packages ****" && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		jq && \
	echo "**** clean up ****" && \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/* && \
        echo "**** install SpiderOakONE ****" && \
	curl -sS https://spideroak.com/release/spideroak/slack_tar_x64 | tar -xzf -

COPY root /

VOLUME ["/config"]


