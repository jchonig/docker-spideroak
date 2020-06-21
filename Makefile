TARBALL=slack_tar_x64.tgz

all:	${TARBALL}
	docker build -t spideroakone  .

${TARBALL}:
	curl -Ls https://spideroak.com/release/spideroak/slack_tar_x64 -o ${TARBALL}
