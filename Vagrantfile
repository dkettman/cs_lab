# -*- mode: ruby -*-
# vi: set ft=ruby :

$script_set_default_route =  <<-'SCRIPT'
if (!(Get-NetRoute | Where-Object {$_.NextHop -eq "172.31.10.1"})) {
  New-NetRoute -InterfaceIndex 6 -NextHop 172.31.10.1 -DestinationPrefix 0.0.0.0/0
}
SCRIPT

Vagrant.configure("2") do |config|
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
    dc.vm.provision "chef_zero" do |chef|
      chef.nodes_path = "./nodes"
      chef.add_recipe "deploy_dc"
    end
    dc.vm.provision "shell", inline: $script_set_default_route
  end

  # config.vm.define "admin" do |admin|
  #   admin.vm.box = "gusztavvargadr/windows-server"
  #   admin.vm.network "private_network", ip: "172.31.10.15", virtualbox__intnet: "NATNetwork"
  # end
  
end

