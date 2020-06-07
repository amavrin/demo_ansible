
Vagrant.configure("2") do |config|
  config.vm.define "manager" do |manager|
    manager.vm.box = "hashicorp/bionic64"
    manager.vm.hostname = "manager"
    manager.vm.network "private_network",
      ip: "10.250.1.200",
      virtualbox_intnet: true
    config.vm.provision :shell, path: "install_ansible.sh"
  end

  config.vm.define "host1" do |host1|
    host1.vm.box = "hashicorp/bionic64"
    host1.vm.hostname = "vm1"
    host1.vm.network "private_network",
      ip: "10.250.1.201",
      virtualbox_intnet: true
  end



end

