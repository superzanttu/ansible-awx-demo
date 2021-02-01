#!/bin/bash

VMS=("awx" "minion1" "minion2" "tool")

for vm in ${VMS[*]}; do
  echo Snapshot for $vm
  VBoxManage snapshot $vm delete temp_state
done
