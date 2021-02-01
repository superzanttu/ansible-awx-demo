#!/bin/bash
#export TOWER_HOST=awx.local
#export TOWER_USERNAME=admin
#export TOWER_PASSWORD=password
#export TOWER_VERIFY_SSL=False

ansible-playbook  -vvv -i ./provisioning/inventory_awx -u vagrant --private-key ~/.vagrant.d/insecure_private_key  ./provisioning/configure_awx.yml
