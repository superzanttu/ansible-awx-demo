#!/bin/bash

ansible-playbook -i local_inventory -K local_config.yml
