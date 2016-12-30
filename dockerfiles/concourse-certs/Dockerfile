FROM alpine

RUN apk add --update \
		openssh-client && \
	rm -rf /var/cache/apk/*

RUN cd /data && \
	mkdir -p ./{web,worker}

RUN ssh-keygen -t rsa -f ./web/tsa_host_key -N '' && \
	ssh-keygen -t rsa -f ./web/session_signing_key -N '' && \
	ssh-keygen -t rsa -f ./worker/worker_key -N '' && \
	cp ./worker/worker_key.pub ./web/authorized_worker_keys && \
	cp ./web/tsa_host_key.pub ./worker/
