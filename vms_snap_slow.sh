#!/bin/bash
# Halt, snapshot and up all VMs using Vagrant (slow)

vagrant halt
vagrant snapshot tool save dev_state
vagrant snapshot awx save dev_state
vagrant snapshot minion1 save dev_state
vagrant snapshot minion2 save dev_state
vagrant up

echo Done.
