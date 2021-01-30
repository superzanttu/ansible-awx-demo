# ansible-awx-demo
Vagrant.configure("2") do |config|

  # AWX VM
  config.vm.define "awx" do |awx|
    awx.vm.define "awx"
    awx.vm.box = "debian/buster64"
    awx.vm.hostname = "awx.local"
    awx.vm.network :private_network, ip: "192.168.6.65"
    awx.ssh.insert_key = false

    awx.vm.provider :virtualbox do |v|
      v.name = "awx"
      v.memory = 4096
      v.cpus = 2
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    awx.vm.provision :ansible do |ansible|
      ansible.compatibility_mode = "auto"
      ansible.playbook = "provisioning/build_awx_vm.yml"
      ansible.inventory_path = "provisioning/inventory_awx"
      ansible.become = true
    end

    #awx.vm.provision :ansible do |ansible|
    #  ansible.compatibility_mode = "auto"
    #  ansible.playbook = "provisioning/configure_awx.yml"
    #  ansible.inventory_path = "provisioning/inventory_awx"
    #  ansible.become = true
    #end
  end

  # minion1 VM
  config.vm.define "minion1" do |m|
    m.vm.define "minion1"
    m.vm.box = "debian/buster64"
    m.vm.hostname = "minion1.local"
    m.vm.network :private_network, ip: "192.168.6.66"
    m.ssh.insert_key = false

    m.vm.provider :virtualbox do |v|
      v.name = "minion1"
      v.memory = 512
      v.cpus = 1
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    m.vm.provision :ansible do |ansible|
      ansible.compatibility_mode = "auto"
      ansible.playbook = "provisioning/build_minion.yml"
      ansible.inventory_path = "provisioning/inventory_minions"
      ansible.become = true
    end

  end

  # minion2 VM
  config.vm.define "minion2" do |m|
    m.vm.define "minion2"
    m.vm.box = "debian/buster64"
    m.vm.hostname = "minion2.local"
    m.vm.network :private_network, ip: "192.168.6.67"
    m.ssh.insert_key = false

    m.vm.provider :virtualbox do |v|
      v.name = "minion2"
      v.memory = 512
      v.cpus = 1
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    m.vm.provision :ansible do |ansible|
      ansible.compatibility_mode = "auto"
      ansible.playbook = "provisioning/build_minion.yml"
      ansible.inventory_path = "provisioning/inventory_minions"
      ansible.become = true
    end
  end

  # tool VM
  config.vm.define "tool" do |m|
    m.vm.define "tool"
    m.vm.box = "debian/buster64"
    m.vm.hostname = "tool.local"
    m.vm.network :private_network, ip: "192.168.6.68"
    m.ssh.insert_key = false

    m.vm.provider :virtualbox do |v|
      v.name = "tool"
      v.memory = 2048
      v.cpus = 2
      v.customize ["modifyvm", :id, "--vram", "12"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    m.vm.provision :ansible do |ansible|
      ansible.compatibility_mode = "auto"
      ansible.playbook = "provisioning/build_tool.yml"
      ansible.inventory_path = "provisioning/inventory_tool"
      ansible.become = true
    end
  end
end
