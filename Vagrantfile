# ansible-awx-demo

$ANSIBLE_VERBOSITY_LEVEL = "vvvv"


$VM_BOX = "debian/buster64"
$VM_NETWORK_TYPE = "private_network"

$AWX_VM_IP = "192.168.6.65"
$MINION1_VM_IP = "192.168.6.66"
$MINION2_VM_IP = "192.168.6.67"
$TOOL_VM_IP = "192.168.6.68"

$AWX_VM_NAME = "awx"
$MINION1_VM_NAME = "minion1"
$MINION2_VM_NAME = "minion2"
$TOOL_VM_NAME = "tool"

$AWX_VM_HOSTNAME = "awx.local"
$MINION1_VM_HOSTNAME = "minion1.local"
$MINION2_VM_HOSTNAME = "minion2.local"
$TOOL_VM_HOSTNAME = "tool.local"

$AWX_VM_MEMORY = "4094"
$MINION1_VM_MEMORY = "512"
$MINION2_VM_MEMORY = "512"
$TOOL_VM_MEMORY = "2048"

$AWX_VM_CPUS = "2"
$MINION1_VM_CPUS = "1"
$MINION2_VM_CPUS = "1"
$TOOL_VM_CPUS = "2"

Vagrant.configure("2") do |config|

  # AWX VM
  config.vm.define $AWX_VM_NAME do |awx|
    awx.vm.define $AWX_VM_NAME
    awx.vm.box = $VM_BOX
    awx.vm.hostname = $AWX_VM_HOSTNAME
    awx.vm.network $VM_NETWORK_TYPE, ip: $AWX_VM_IP
    awx.ssh.insert_key = false

    awx.vm.provider :virtualbox do |v|
      v.name = $AWX_VM_NAME
      v.memory = $AWX_VM_MEMORY
      v.cpus = $AWX_VM_CPUS
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
  config.vm.define $MINION1_VM_NAME do |m|
    m.vm.define $MINION1_VM_NAME
    m.vm.box = $VM_BOX
    m.vm.hostname = $MINION1_VM_HOSTNAME
    m.vm.network $VM_NETWORK_TYPE, ip: $MINION1_VM_IP
    m.ssh.insert_key = false

    m.vm.provider :virtualbox do |v|
      v.name = $MINION1_VM_NAME
      v.memory = $MINION1_VM_MEMORY
      v.cpus = $MINION1_VM_NAME
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    m.vm.provision :ansible do |ansible|
      ansible.verbose = $ANSIBLE_VERBOSITY_LEVEL
      ansible.compatibility_mode = "auto"
      ansible.playbook = "provisioning/build_minion.yml"
      ansible.inventory_path = "provisioning/inventory_minions"
      ansible.become = true
    end

  end

  # minion2 VM
  config.vm.define $MINION2_VM_NAME do |m|
    m.vm.define $MINION2_VM_NAME
    m.vm.box = $VM_BOX
    m.vm.hostname = $MINION2_VM_HOSTNAME
    m.vm.network $VM_NETWORK_TYPE, ip: $MINION2_VM_IP
    m.ssh.insert_key = false

    m.vm.provider :virtualbox do |v|
      v.name = $MINION2_VM_NAME
      v.memory = $MINION2_VM_MEMORY
      v.cpus = $MINION2_VM_CPUS
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    m.vm.provision :ansible do |ansible|
      ansible.verbose = $ANSIBLE_VERBOSITY_LEVEL
      ansible.compatibility_mode = "auto"
      ansible.playbook = "provisioning/build_minion.yml"
      ansible.inventory_path = "provisioning/inventory_minions"
      ansible.become = true
    end
  end

  # tool VM
  config.vm.define $TOOL_VM_NAME do |m|
    m.vm.define $TOOL_VM_NAME
    m.vm.box = $VM_BOX
    m.vm.hostname = $TOOL_VM_HOSTNAME
    m.vm.network $VM_NETWORK_TYPE, ip: $TOOL_VM_IP
    m.ssh.insert_key = false

    m.vm.provider :virtualbox do |v|
      v.name = $TOOL_VM_NAME
      v.memory = $TOOL_VM_MEMORY
      v.cpus = $TOOL_VM_CPUS
      v.gui = true
      v.customize ["modifyvm", :id, "--vram", "12"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    m.vm.provision :ansible do |ansible|
      ansible.verbose = $ANSIBLE_VERBOSITY_LEVEL
      ansible.compatibility_mode = "auto"
      ansible.playbook = "provisioning/build_tool.yml"
      ansible.inventory_path = "provisioning/inventory_tool"
      ansible.become = true
    end
  end
end
