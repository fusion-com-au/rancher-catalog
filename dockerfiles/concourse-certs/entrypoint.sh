#!/bin/sh

mkdir -p $CERT_ROOT

[[ ! -f $CERT_ROOT/tsa_host_key ]] && \
	ssh-keygen -t rsa -f $CERT_ROOT/tsa_host_key -N ''

[[ ! -f $CERT_ROOT/session_signing_key ]] && \
	ssh-keygen -t rsa -f $CERT_ROOT/session_signing_key -N ''

[[ ! -f $CERT_ROOT/worker_key ]] && \
	ssh-keygen -t rsa -f $CERT_ROOT/worker_key -N ''
	cat $CERT_ROOT/worker_key.pub > $CERT_ROOT/authorized_worker_keys

exec "${@}"