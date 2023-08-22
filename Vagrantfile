# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.winrm.transport = :plaintext
  config.winrm.basic_auth_only = true

  config.vm.provider "virtualbox" do |vb|
    # Use Linked Clones
    vb.linked_clone = true
  end

  # Domain Controller
  # This box has an IP defined out of the gate since it should always have the same static IP
  config.vm.define "dc" do |dc|
    dc.vm.box = "gusztavvargadr/windows-server-core"
    dc.vm.hostname = "dc"
    dc.vm.network "private_network", ip: "172.31.10.10", virtualbox__intnet: "NATNetwork"
    dc.vm.provision "chef_solo" do |chef| chef.add_recipe "recipe[cs_lab::deploy_dc]" end
    dc.vm.provision :reload
    dc.vm.provision "chef_solo" do |chef| chef.add_recipe "recipe[cs_lab::deploy_dhcp]" end
    dc.vm.provision "chef_solo" do |chef| chef.add_recipe "recipe[cs_lab::deploy_ad]" end
  end

  config.vm.define "admin" do |admin|
    admin.vm.box = "gusztavvargadr/windows-server"
    admin.vm.network "private_network", ip: "172.31.10.15", virtualbox__intnet: "NATNetwork"
    dc.vm.provision "chef_solo" do |chef| chef.add_recipe "recipe[cs_lab::join_domain]" end
  end
  
end

