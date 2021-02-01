#!/bin/bash
# Destroys and rebuilds all VMs

time vagrant destroy --parallel
time vagrant up

echo Done.
