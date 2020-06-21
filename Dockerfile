FROM lsiobase/ubuntu:focal

ENV \
	HOME=/config \
	TZ=UTC

# Add SpiderOakONE
ADD slack_tar_x64.tgz /

COPY root /

VOLUME ["/config"]


