FROM alpine

RUN apk add --update \
		openssh-client && \
	rm -rf /var/cache/apk/*

VOLUME ["/data"]

RUN mkdir -p /data/{web,worker}
RUN ssh-keygen -t rsa -f /data/web/tsa_host_key -N '' && \
	ssh-keygen -t rsa -f /data/web/session_signing_key -N '' && \
	ssh-keygen -t rsa -f ./data/worker/worker_key -N '' && \
	cp /data/worker/worker_key.pub /data/web/authorized_worker_keys && \
	cp /data/web/tsa_host_key.pub /data/worker
