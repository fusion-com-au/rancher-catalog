FROM alpine
MAINTAINER Zenobius Jiricek <airtonix@gmail.com>

RUN apk add --update \
		openssh-client && \
	rm -rf /var/cache/apk/*

RUN mkdir -p /data/web && \
	mkdir /data/worker

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
