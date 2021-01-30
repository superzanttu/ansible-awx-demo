# ansible-awx-demo

ZZZANSIBLE_VERBOSITY_LEVEL = "vvvv"


ZZZVM_BOX = "debian/buster64"
ZZZVM_NETWORK_TYPE = "private_network"

ZZZAWX_VM_IP = "192.168.6.65"
ZZZMINION1_VM_IP = "192.168.6.66"
ZZZMINION2_VM_IP = "192.168.6.67"
ZZZTOOL_VM_IP = "192.168.6.68"

ZZZAWX_VM_NAME = "awx"
ZZZMINION1_VM_NAME = "minion1"
ZZZMINION2_VM_NAME = "minion2"
ZZZTOOL_VM_NAME = "tool"

ZZZAWX_VM_HOSTNAME = "awx.local"
ZZZMINION1_VM_HOSTNAME = "minion1.local"
ZZZMINION2_VM_HOSTNAME = "minion2.local"
ZZZTOOL_VM_HOSTNAME = "tool.local"

ZZZAWX_VM_MEMORY = "4094"
ZZZMINION1_VM_MEMORY = "512"
ZZZMINION2_VM_MEMORY = "512"
ZZZTOOL_VM_MEMORY = "2048"

ZZZAWX_VM_CPUS = "2"
ZZZMINION1_VM_CPUS = "1"
ZZZMINION2_VM_CPUS = "1"
ZZZTOOL_VM_CPUS = "2"

Vagrant.configure("2") do |config|

  # AWX VM
  config.vm.define ZZZAWX_VM_NAME do |awx|
    awx.vm.define ZZZAWX_VM_NAME
    awx.vm.box = ZZZVM_BOX
    awx.vm.hostname = ZZZAWX_VM_HOSTNAME
    awx.vm.network ZZZVM_NETWORK_TYPE, ip: ZZZAWX_VM_IP
    awx.ssh.insert_key = false

    awx.vm.provider :virtualbox do |v|
      v.name = ZZZAWX_VM_NAME
      v.memory = ZZZAWX_VM_MEMORY
      v.cpus = ZZZAWX_VM_CPUS
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
  config.vm.define ZZZMINION1_VM_NAME do |m|
    m.vm.define ZZZMINION1_VM_NAME
    m.vm.box = ZZZVM_BOX
    m.vm.hostname = ZZZMINION1_VM_HOSTNAME
    m.vm.network ZZZVM_NETWORK_TYPE, ip: ZZZMINION1_VM_IP
    m.ssh.insert_key = false

    m.vm.provider :virtualbox do |v|
      v.name = ZZZMINION1_VM_NAME
      v.memory = ZZZMINION1_VM_MEMORY
      v.cpus = ZZZMINION1_VM_NAME
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    m.vm.provision :ansible do |ansible|
      ansible.verbose = ZZZANSIBLE_VERBOSITY_LEVEL
      ansible.compatibility_mode = "auto"
      ansible.playbook = "provisioning/build_minion.yml"
      ansible.inventory_path = "provisioning/inventory_minions"
      ansible.become = true
    end

  end

  # minion2 VM
  config.vm.define ZZZMINION2_VM_NAME do |m|
    m.vm.define ZZZMINION2_VM_NAME
    m.vm.box = ZZZVM_BOX
    m.vm.hostname = ZZZMINION2_VM_HOSTNAME
    m.vm.network ZZZVM_NETWORK_TYPE, ip: ZZZMINION2_VM_IP
    m.ssh.insert_key = false

    m.vm.provider :virtualbox do |v|
      v.name = ZZZMINION2_VM_NAME
      v.memory = ZZZMINION2_VM_MEMORY
      v.cpus = ZZZMINION2_VM_CPUS
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    m.vm.provision :ansible do |ansible|
      ansible.verbose = ZZZANSIBLE_VERBOSITY_LEVEL
      ansible.compatibility_mode = "auto"
      ansible.playbook = "provisioning/build_minion.yml"
      ansible.inventory_path = "provisioning/inventory_minions"
      ansible.become = true
    end
  end

  # tool VM
  config.vm.define ZZZTOOL_VM_NAME do |m|
    m.vm.define ZZZTOOL_VM_NAME
    m.vm.box = ZZZVM_BOX
    m.vm.hostname = ZZZTOOL_VM_HOSTNAME
    m.vm.network ZZZVM_NETWORK_TYPE, ip: ZZZTOOL_VM_IP
    m.ssh.insert_key = false

    m.vm.provider :virtualbox do |v|
      v.name = ZZZTOOL_VM_NAME
      v.memory = ZZZTOOL_VM_MEMORY
      v.cpus = ZZZTOOL_VM_CPUS
      v.gui = true
      v.customize ["modifyvm", :id, "--vram", "12"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    m.vm.provision :ansible do |ansible|
      ansible.verbose = ZZZANSIBLE_VERBOSITY_LEVEL
      ansible.compatibility_mode = "auto"
      ansible.playbook = "provisioning/build_tool.yml"
      ansible.inventory_path = "provisioning/inventory_tool"
      ansible.become = true
    end
  end
end
