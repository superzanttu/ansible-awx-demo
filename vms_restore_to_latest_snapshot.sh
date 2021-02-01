#!/bin/bast
# Restores all VMs from latest snapshot

VMS=("awx" "minion1" "minion2" "tool")

# Poweroff and restore latest backup
for vm in ${VMS[*]}; do
  echo Poweroff for  $vm
  VBoxManage controlvm $vm poweroff
  VBoxManage snapshot $vm restorecurrent
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
