ansible-playbook -i local_inventory -K local_config.yml

# Save Vagrant's SSH configuration into vagrant-ssh-configuration file
vagrant ssh-config > vagrant-ssh-configuration
