#!/bin/bash
# Run ansible playbook for testing

ansible-playbook  -vvv -i ./provisioning/inventory_awx -u vagrant --private-key ~/.vagrant.d/insecure_private_key  ./provisioning/configure_awx.yml

echo Done.
