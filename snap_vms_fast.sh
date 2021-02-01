#!/bin/bash

VMS=("awx" "minion1" "minion2" "tool")

#VBoxManage controlvm tool acpipowerbutton
#VBoxManage controlvm awx acpipowerbutton
#VBoxManage controlvm minion1 acpipowerbutton
#VBoxManage controlvm minion2 acpipowerbutton

for vm in ${VMS[*]}; do
  echo ACPI poweroff for $vm
  vagrant halt $vm
  #VBoxManage controlvm $vm acpipowerbutton &
done

for vm in ${VMS[*]}; do
  echo Waiting $vm to poweroff
  until $(VBoxManage showvminfo --machinereadable $vm | grep -q ^VMState=.poweroff.)
  do
    sleep 1
  done
done

for vm in ${VMS[*]}; do
  echo Snapshot for $vm
  VBoxManage snapshot $vm take temp_state
done

for vm in ${VMS[*]}; do
  echo Starting $vm
  if [ $vm == "tool" ]; then
    VBoxManage startvm $vm --type gui
  else
    VBoxManage startvm $vm --type headless
  fi
done

echo Done.
