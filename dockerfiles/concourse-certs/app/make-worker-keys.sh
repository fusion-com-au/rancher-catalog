#!/bin/sh
source ./logger.sh

LOG_PREFIX="[worker-keys]"
DEST=$([[ -n "${1}" ]] && echo "${1}" || echo "${PWD}")
WORKER_ID=$([[ -n "${2}" ]] && echo "${2}" || echo 1)

WORKER_NAME="worker-${WORKER_ID}"
WORKER_TARGET="${DEST}/keys/worker/${WORKER_NAME}"
TSA_TARGET="${DEST}/keys/tsa"

log "Making keys for ${WORKER_NAME}"

if [[ -e "${WORKER_TARGET}" ]]; then
	log "wipe existing: ${WORKER_TARGET}"
	rm -rf "${WORKER_TARGET}";
fi

log "create target: ${WORKER_TARGET}"
mkdir -p "${WORKER_TARGET}"

if [[ ! -e "${WORKER_TARGET}/worker_key" ]]; then
	log "make keys: ${WORKER_TARGET}/worker_key"
	ssh-keygen -t rsa -f "${WORKER_TARGET}/worker_key" -N ''
	log "authorise worker with tsa: ${WORKER_TARGET}/worker_key.pub" ">" "${TSA_TARGET}/authorized_keys"
	cat "${WORKER_TARGET}/worker_key.pub"  >> "${TSA_TARGET}/authorized_keys"
fi

if [[ ! -e "${WORKER_TARGET}/tsa_host_key.pub" ]] && [ -e "${TSA_TARGET}/tsa_host_key.pub" ]; then
	log "authorise tsa with worker: ${TSA_TARGET}/tsa_host_key.pub" "${WORKER_TARGET}"
	cp "${TSA_TARGET}/tsa_host_key.pub" "${WORKER_TARGET}"
fi


