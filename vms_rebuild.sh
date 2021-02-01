#!/bin/bash
# Destroys and rebuilds all VMs

time vagrant destroy --parallel
time vagrant up

# Save Vagrant's SSH configuration into vagrant-ssh-configuration file for direct ssh access
vagrant ssh-config > vagrant-ssh-configuration


echo Done.
