#!/bin/sh

if [ !-n $MAKE_TSA_KEYS ]; then
	./make-tsa-keys.sh $KEYS_STORAGE
fi

if [ !-n $MAKE_WORKER_KEYS ]; then
	./make-worker-keys.sh $KEYS_STORAGE
fi
