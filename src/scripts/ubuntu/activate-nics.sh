#!/bin/bash

DISTRIBUTION=$(lsb_release -is)
CODENAME=$(lsb_release -cs)

MANAGED_NIC=$(cat /etc/network/interfaces.d/*.cfg |  grep -E "^iface [^(lo)]" | awk '{ print $2 }')
OTHER_NICS=$(ip addr show | grep -E "^[0-9]+:" | awk '{print $2}' | cut -d: -f1 | grep -v lo | grep -v $MANAGED_NIC)

for NIC in $OTHER_NICS; do
  cat <<EOF > /etc/network/interfaces.d/$NIC.cfg
# Do not edit! This file is managed by Heat
auto $NIC
iface $NIC inet dhcp
EOF
  ifup $NIC
done
