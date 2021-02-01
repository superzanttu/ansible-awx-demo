#!/bin/bash

VBoxManage snapshot tool restore temp_state
VBoxManage snapshot awx restore temp_state
VBoxManage snapshot minion1 restore temp_state
VBoxManage snapshot minion2 restore temp_state

VBoxManage startvm tool
VBoxManage startvm awx
VBoxManage startvm minion1
VBoxManage startvm minion2
