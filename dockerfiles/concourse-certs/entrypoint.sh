#!/bin/sh

mkdir -p $CERT_ROOT/web
mkdir -p $CERT_ROOT/worker

[[ ! -f $CERT_ROOT/web/tsa_host_key ]] && \
	ssh-keygen -t rsa -f $CERT_ROOT/web/tsa_host_key -N ''
	cp $CERT_ROOT/web/tsa_host_key.pub $CERT_ROOT/worker/

[[ ! -f $CERT_ROOT/web/session_signing_key ]] && \
	ssh-keygen -t rsa -f $CERT_ROOT/web/session_signing_key -N ''

[[ ! -f $CERT_ROOT/worker/worker_key ]] && \
	ssh-keygen -t rsa -f $CERT_ROOT/worker/worker_key -N ''
	cp $CERT_ROOT/worker/worker_key.pub
		$CERT_ROOT/web/tsa-authorized-keys

exec "${@}"