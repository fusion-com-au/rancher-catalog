#!/bin/sh
DATE='date +%Y/%m/%d:%H:%M:%S'
function log {
  echo "[KEYS] "`$DATE`" $1" >&2;
}

log "making key store"
mkdir -p /concourse-keys

log "generate.key: tsa host"
ssh-keygen -t rsa -f /concourse-keys/tsa_host_key -N ''

log "generate.key: session"
ssh-keygen -t rsa -f /concourse-keys/session_signing_key -N ''

log "generate.key: worker"
ssh-keygen -t rsa -f /concourse-keys/worker_key -N ''

log "authorize.key: worker"
cp /concourse-keys/worker_key.pub /concourse-keys/authorized_worker_keys

ls -al /concourse-keys

exec "$@"