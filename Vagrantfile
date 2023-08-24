# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.winrm.transport = :plaintext
  config.winrm.basic_auth_only = true

  config.vm.provider "virtualbox" do |vb|
    # Use Linked Clones
    vb.linked_clone = true
    # Dont complain about mismatched guest additions
    vb.check_guest_additions = false
  end

  config.vm.provider "hyperv" do |hyperv|
    hyperv.linked_clone = true
  end

  config.trigger.before :destroy do |teardown|
    teardown.name = "Teardown VM"
    teardown.info = "DIE! DIE! DIE!"
  end

  # Domain Controller
  # This box has an IP defined out of the gate since it should always have the same static IP
  config.vm.define "dc" do |dc|
    dc.vm.box = "gusztavvargadr/windows-server-core"
    dc.vm.hostname = "dc"
    dc.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
    dc.vm.network "private_network", ip: "172.31.10.10", virtualbox__intnet: "NATNetwork"
    dc.vm.provision "chef_solo" do |chef| chef.add_recipe "recipe[cs_lab::deploy_dc]" end
    dc.vm.provision :reload
    dc.vm.provision "chef_solo" do |chef|
      chef.add_recipe "recipe[cs_lab::deploy_dhcp]"
      chef.add_recipe "recipe[cs_lab::deploy_ad]"
    end
    
  end

  config.vm.define "admin", primary: true do |admin|
    admin.vm.box = "gusztavvargadr/windows-server"
    admin.vm.hostname = "admin"
    admin.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    admin.vm.network "private_network", ip: "172.31.10.15", virtualbox__intnet: "NATNetwork"
    admin.vm.provision "chef_solo" do |chef| chef.add_recipe "recipe[cs_lab::join_domain]" end
    admin.vm.provision :reload
    admin.vm.provision "chef_solo" do |chef|
      chef.add_recipe "recipe[cs_lab::install_ssms]"
    end
  end

  config.vm.define "sql" do |sql|
    sql.vm.box = "gusztavvargadr/windows-server-core"
    sql.vm.hostname = "sql"
    sql.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
    end
    sql.vm.network "private_network", ip: "172.31.10.20", virtualbox__intnet: "NATNetwork"
    sql.vm.provision "chef_solo" do |chef| chef.add_recipe "recipe[cs_lab::join_domain]" end
    sql.vm.provision :reload
    sql.vm.provision "chef_solo" do |chef|
      chef.add_recipe "recipe[cs_lab::install_sql]"
    end
  end

  config.vm.define "util" do |util|
    util.vm.box = "gusztavvargadr/windows-server"
    util.vm.hostname = "util"
    util.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    util.vm.network "private_network", ip: "172.31.10.25", virtualbox__intnet: "NATNetwork"
    util.vm.provision "chef_solo" do |chef| chef.add_recipe "recipe[cs_lab::join_domain]" end
    util.vm.provision :reload
  end
  
end

