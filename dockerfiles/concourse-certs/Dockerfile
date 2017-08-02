FROM alpine
MAINTAINER Zenobius Jiricek <airtonix@gmail.com>

RUN apk add --update --no-cache \
		openssh-client && \
	rm -rf /var/cache/apk/*

ENV KEYS_STORAGE /data

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /opt/app
ADD ./app/ .
RUN chmod -R +x .

ENTRYPOINT ["/entrypoint.sh"]
