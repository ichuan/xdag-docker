#!/usr/bin/env bash

set -e
pool_addr=${pool_addr:-195.201.168.17:13655}

mkdir -p /opt/data

if test $# -eq 0; then
  rm -f /opt/data/xdag
  ln -s /opt/coin/xdag /opt/data/xdag
  exec /opt/data/xdag -rpc-enable -rpc-port 7667 $pool_addr
else
  exec $@
fi
