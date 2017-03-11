# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  config.vm.box_check_update = false
  config.vm.network "private_network", type: "dhcp"

  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true
  config.vm.synced_folder ".", "/home/vagrant/myproject"

  config.vm.provider "virtualbox" do |vb|
     # name of the VM
     vb.name = "myproject"

     # Display the VirtualBox GUI when booting the machine
     vb.gui = false
  
     # Customize the amount of memory on the VM:
     vb.memory = "768"
   end
  
  
  # vagrant-vbguest plugin:
  # installs VirtualBox Guest Additions automatically
  #
  # set auto_update to false, if you do NOT want to check the correct 
  # additions version when booting this machine
  config.vbguest.auto_update = true
  # do NOT download the iso file from a webserver
  config.vbguest.no_remote = true
  

  config.vm.provision "shell", inline: <<-SHELL
    sh /home/vagrant/myproject/vagrant-build/bootstrap.sh
  SHELL

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "vagrant-build/salt-config/minion"
    salt.bootstrap_options = "-P -c /tmp"
    salt.run_highstate = true

    # Optionally define pillar data
    #salt.pillar({
    #    "hostnames" => {
    #       "www" => "www.example.com",
    #       "intranet" => "intranet.example.com"
    #    }
    #})
  end

  # Post bootstrap shell
  config.vm.provision "shell", inline: <<-SHELL
    sh /home/vagrant/myproject/vagrant-build/post-bootstrap.sh
  SHELL

end
