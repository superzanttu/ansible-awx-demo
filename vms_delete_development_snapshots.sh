#!/bin/bash
# Deletes development snapshots (dev_state)

VMS=("awx" "minion1" "minion2" "tool")

for vm in ${VMS[*]}; do
  echo "Delete development snapshots (dev_state) of $vm"
  VBoxManage snapshot "$vm" list | grep -i "dev_state" | awk -F "UUID: " '{print $2}' | awk -F ")" '{print $1}' | xargs -L1 VBoxManage snapshot "$vm" delete
done

echo Done.
