FROM alpine
MAINTAINER Zenobius Jiricek <airtonix@gmail.com>

RUN apk add --update --no-cache \
		openssh-client && \
	rm -rf /var/cache/apk/*

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
