#!/bin/bash
# Quickly powers off and snapshots all VMs

VMS=("awx" "minion1" "minion2" "tool")

# Shutdown all VMs
for vm in ${VMS[*]}; do
  echo Ask Vagrant to shutdown $vm
  vagrant halt $vm
done

# Wait until all VMs are powered off
for vm in ${VMS[*]}; do
  echo Waiting $vm to poweroff
  until $(VBoxManage showvminfo --machinereadable $vm | grep -q ^VMState=.poweroff.)
  do
    sleep 1
  done
done

# Take develeopment snapshot
for vm in ${VMS[*]}; do
  echo Snapshot for $vm
  VBoxManage snapshot $vm take dev_state
done

# Start VMs
for vm in ${VMS[*]}; do
  echo Starting $vm
  if [ $vm == "tool" ]; then
    VBoxManage startvm $vm --type gui
  else
    VBoxManage startvm $vm --type headless
  fi
done

echo Done.
