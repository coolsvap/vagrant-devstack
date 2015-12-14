# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.box_download_insecure = true

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 5555, host: 5555

  config.vm.synced_folder "./", "/vagrant", type: "rsync"

  config.vm.provider "libvirt" do |libvirt|
    libvirt.memory = 4096
  end

  config.vm.provision "shell", path: "provision.sh"
end
