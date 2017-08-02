#!/bin/sh
source ./logger.sh

LOG_PREFIX="[tsa-keys]"

DEST=$([[ -n "${1}" ]] && echo "${1}" || echo "${PWD}")

TSA_TARGET="${DEST}/keys/tsa"

log "make target ${TSA_TARGET}"
mkdir -p "${TSA_TARGET}"

log "make host key: ${TSA_TARGET}/tsa_host_key"
ssh-keygen -t rsa -f ${TSA_TARGET}/tsa_host_key -N ''

log "make signing key: ${TSA_TARGET}/session_signing_key"
ssh-keygen -t rsa -f ${TSA_TARGET}/session_signing_key -N ''
