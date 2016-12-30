#!/bin/sh

mkdir -p /data/web
mkdir -p /data/worker

[[ ! -f /data/web/tsa_host_key ]] && \
	ssh-keygen -t rsa -f /data/web/tsa_host_key -N ''
	cp /data/web/tsa_host_key.pub /data/worker/

[[ ! -f /data/web/session_signing_key ]] && \
	ssh-keygen -t rsa -f /data/web/session_signing_key -N ''

[[ ! -f /data/worker/worker_key ]] && \
	ssh-keygen -t rsa -f /data/worker/worker_key -N ''
	cp /data/worker/worker_key.pub
		/data/web/authorized_worker_keys

exec "${@}"