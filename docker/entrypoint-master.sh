#!/bin/bash

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

/home/yugabyte/bin/yb-master --fs_data_dirs=/mnt/data0 --rpc_bind_addresses=$(POD_IP):7100 --server_broadcast_addresses=$(POD_NAME).yb-masters:7100 --use_private_ip=never --master_addresses=yb-masters.$(NAMESPACE).svc.cluster.local:7100 --use_initial_sys_catalog_snapshot=true --master_replication_factor=1 --replication_factor=1 --logtostderr