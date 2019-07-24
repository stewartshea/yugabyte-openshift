#!/bin/bash

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

/home/yugabyte/bin/yb-master \
  --fs_data_dirs=/yugabyte-data \
  --rpc_bind_addresses=localhost:9100 \
  --server_broadcast_addresses=localhost:9100 \
  --start_pgsql_proxy \
  --pgsql_proxy_bind_address=localhost:5433 \
  --use_private_ip=never \
  --tserver_master_addrs=localhost:7100 \
  --tserver_master_replication_factor=1 \
  --logtostderr