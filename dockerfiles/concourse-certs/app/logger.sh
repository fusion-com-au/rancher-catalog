#!/bin/sh

log () {
	echo "${LOG_PREFIX} <$(date -u +%D-%T-%N)> $1 " >&2
}
