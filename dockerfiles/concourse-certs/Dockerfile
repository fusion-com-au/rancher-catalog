FROM alpine
MAINTAINER Zenobius Jiricek <airtonix@gmail.com>
ENV CERT_ROOT=/concourse-keys

RUN apk add --update \
		openssh-client && \
	rm -rf /var/cache/apk/*

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
