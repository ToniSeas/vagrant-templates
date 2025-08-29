# Vagrantfile Template

Vagrant.configure("2") do |config|
  # Define the VM
  config.vm.define "vm_name" do |vm_config|
    # Box settings
    vm_config.vm.box = "distro_name" # e.g., "bento/ubuntu-22.04"

    # Hostname
    vm_config.vm.hostname = "hostname"

    # Networking
    vm_config.vm.network "private_network"

    # Provisioning
    config.vm.provision "shell", path: "provision/01-update.sh"
    config.vm.provision "shell", path: "provision/02-install-gui.sh"

    # Provider-specific settings
    vm_config.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.gui = true
      vb.name = "vm_name"
    end
  end
end