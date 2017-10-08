#!/bin/bash

USER=$1
PASS=$2

etcdctl --endpoints=http://kv.kndl.io:2379 user add "${USER}:${PASS}"
etcdctl --endpoints=http://kv.kndl.io:2379 role add ${USER}
etcdctl --endpoints=http://kv.kndl.io:2379 role grant-permission ${USER} --prefix=true readwrite /u/${USER}/
etcdctl --endpoints=http://kv.kndl.io:2379 user grant-role ${USER} ${USER}
