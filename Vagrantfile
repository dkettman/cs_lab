# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'pp'

# RabbitMQ Provisioning script for option Linux RMQ server
$install_rmq_script = <<-'SCRIPT'
echo "Installing RabbitMQ Server"
sudo apt update
sudo apt install -y rabbitmq-server
SCRIPT

Vagrant.configure("2") do |config|

  config.winrm.transport = :plaintext
  config.winrm.basic_auth_only = true

  config.vm.provision "join_domain", type: "chef_solo", run: "never" do |chef| chef.add_recipe "recipe[cs_lab::join_domain]" end

  config.vm.provider "virtualbox" do |vb|
    # Use Linked Clones
    vb.linked_clone = true
    # Dont complain about mismatched guest additions
    vb.check_guest_additions = false
  end

  config.vm.provider "hyperv" do |hv|
    # Use Linked Clones
    hv.linked_clone = true
    hv.enable_virtualization_extensions = true
    hv.vm_integration_services = {
      guest_service_interface: true,
      heartbeat: true,
      key_value_pair_exchange: true,
      shutdown: true,
      time_synchronization: true,
      vss: true,
    }
  end

  # config.trigger.before :destroy do |teardown|
  #   teardown.name = "Teardown VM"
  #   teardown.info = "Removing Computer from Domain"
  #   teardown.run_remote = { inline: 'Install-WindowsFeature RSAT-AD-Powershell; Remove-ADComputer $env:COMPUTERNAME -Confirm:$false -Server 172.31.10.10' }
  # end

  # Domain Controller
  # This box has an IP defined out of the gate since it should always have the same static IP
  config.vm.define "dc" do |dc|
    dc.vm.box = "gusztavvargadr/windows-server-core"
    dc.vm.hostname = "dc"
    dc.vm.synced_folder "C:\\backup\\#{dc.vm.hostname}", '/Backup', create: true
    dc.vm.provider 'virtualbox' do |v|
      v.memory = 1024
      v.cpus = 1
    end
    dc.vm.provider 'hyperv' do |hv|
      hv.memory = 768
      hv.maxmemory = 2048
      hv.cpus = 1
    end
    dc.vm.network "private_network", ip: "172.31.10.10", virtualbox__intnet: "CSLab", bridge: "CSLab"
    dc.vm.provision "fix_perms", type: "chef_solo", run: "once" do |chef| chef.add_recipe "recipe[cs_lab::fix_perms]" end
    dc.vm.provision "deploy_dc", type: "chef_solo", run: "once" do |chef| chef.add_recipe "recipe[cs_lab::deploy_dc]" end
    dc.vm.provision 'shell', reboot: true
    dc.vm.provision "deploy_dhcp", type: "chef_solo", run: "once" do |chef| chef.add_recipe "recipe[cs_lab::deploy_dhcp]" end
    dc.vm.provision "deploy_ad", type: "chef_solo", run: "once" do |chef| chef.add_recipe "recipe[cs_lab::deploy_ad]" end
    dc.vm.provision "provision_ad", type: "chef_solo", run: "once" do |chef| chef.add_recipe "recipe[cs_lab::provision_ad]" end
      dc.trigger.after :up do |t|
        t.name = "Fix Networking"
        t.info = "Resetting Networking Configuration for Domain Controller"
        t.run_remote = { inline: 'if ( "172.31.10.10" -notin (Get-NetIPAddress).ipaddress ) 
                                    { New-NetIPAddress -InterfaceIndex 6 -IPAddress 172.31.10.10 -PrefixLength 24 }' 
                                  }
      end
    end

  config.vm.define "sql" do |sql|
    sql.vm.box = "gusztavvargadr/windows-server-core"
    sql.vm.hostname = "sql"
    sql.vm.synced_folder "C:\\backup\\#{sql.vm.hostname}", '/Backup', create: true
    sql.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    sql.vm.provider "hyperv" do |hv|
      hv.maxmemory = 4096
      hv.memory = 2048
      hv.cpus = 2
    end
    sql.vm.network "private_network", ip: "172.31.10.20", virtualbox__intnet: "CSLab", bridge: "CSLab"
    sql.vm.provision "join_domain", type: "chef_solo", run: "once" do |chef| chef.add_recipe "recipe[cs_lab::join_domain]" end
    sql.vm.provision 'shell', reboot: true
    sql.vm.provision "install_sql", type: "chef_solo", run: "never" do |chef| chef.add_recipe "recipe[cs_lab::install_sql]" end
  end

  config.vm.define "util", primary: true do |util|
    util.vm.box = "gusztavvargadr/windows-server"
    util.vm.hostname = "util"
    util.vm.synced_folder "C:\\backup\\#{util.vm.hostname}", '/Backup', create: true
    util.vm.network "private_network", ip: "172.31.10.25", virtualbox__intnet: "CSLab", bridge: "CSLab"
    util.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    util.vm.provider "hyperv" do |hv|
      hv.memory = 1536
      hv.maxmemory = 2048
      hv.cpus = 2
    end
    util.vm.provision "join_domain", type: "chef_solo", run: "once" do |chef| chef.add_recipe "recipe[cs_lab::join_domain]" end
    util.vm.provision 'shell', reboot: true
    util.vm.provision "setup_admin", type: "chef_solo" do |chef| chef.add_recipe "recipe[cs_lab::setup_admin]" end
    util.vm.provision "install_ssms", type: "chef_solo" do |chef| chef.add_recipe "recipe[cs_lab::install_ssms]" end

  end

  config.vm.define "web01" do |web01|
    web01.vm.box = "gusztavvargadr/windows-server"
    web01.vm.hostname = "web01"
    web01.vm.synced_folder "C:\\backup\\#{web01.vm.hostname}", '/Backup', create: true
    web01.vm.network "private_network", ip: "172.31.10.50", virtualbox__intnet: "CSLab", bridge: "CSLab"
    web01.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    web01.vm.provider "hyperv" do |hv|
      hv.memory = 1536
      hv.maxmemory = 2048
      hv.cpus = 2
    end
    web01.vm.provision "join_domain", type: "chef_solo", run: "once" do |chef| chef.add_recipe "recipe[cs_lab::join_domain]" end
    web01.vm.provision 'shell', reboot: true
  end

  config.vm.define "web02" do |web02|
    web02.vm.box = "gusztavvargadr/windows-server"
    web02.vm.hostname = "web02"
    web02.vm.synced_folder "C:\\backup\\#{web02.vm.hostname}", '/Backup', create: true
    web02.vm.network "private_network", ip: "172.31.10.51", virtualbox__intnet: "CSLab", bridge: "CSLab"
    web02.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    web02.vm.provider "hyperv" do |hv|
      hv.memory = 1536
      hv.maxmemory = 2048
      hv.cpus = 2
    end
    web02.vm.provision "join_domain", type: "chef_solo", run: "once" do |chef| chef.add_recipe "recipe[cs_lab::join_domain]" end
    web02.vm.provision 'shell', reboot: true
  end


  config.vm.define "linux" do |linux|
    linux.vm.box = "generic/ubuntu2204"
    linux.vm.hostname = "linux"
    linux.vm.synced_folder "C:\\backup\\#{linux.vm.hostname}", '/Backup', create: true, mount_options: ['mfsymlink']
    linux.vm.network "private_network", ip: "172.31.10.60", virtualbox__intnet: "CSLab", bridge: "CSLab"
    linux.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
    linux.vm.provider "hyperv" do |hv|
      hv.memory = 1024
      hv.maxmemory = 2048
      hv.cpus = 1
    end
    linux.vm.provision "install_rmq", type: 'shell', run: "never", inline: $install_rmq_script
  end


  config.vm.define "util-cloud", primary: true do |util|
    util.vm.box = "gusztavvargadr/windows-server"
    util.vm.hostname = "util-cloud"
    util.vm.synced_folder "C:\\backup\\#{util.vm.hostname}", '/Backup', create: true
    util.vm.network "private_network", ip: "172.31.10.25", virtualbox__intnet: "CSLab", bridge: "CSLab"
    util.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    util.vm.provider "hyperv" do |hv|
      hv.memory = 1536
      hv.maxmemory = 2048
      hv.cpus = 2
    end
    util.vm.provision "join_domain", type: "chef_solo", run: "once" do |chef| chef.add_recipe "recipe[cs_lab::join_domain]" end
    util.vm.provision 'shell', reboot: true
  end

#   config.vm.define "<TEMPLATE>" do |<TEMPLATE>|
#     <TEMPLATE>.vm.box = "gusztavvargadr/windows-server"
#     <TEMPLATE>.vm.hostname = "<TEMPLATE>"
#     <TEMPLATE>.vm.synced_folder "C:\\backup\\#{<TEMPLATE>.vm.hostname}", '/Backup', create: true
#     <TEMPLATE>.vm.network "private_network", virtualbox__intnet: "CSLab"
#     <TEMPLATE>.vm.provider "virtualbox" do |v|
#       v.memory = 2048
#       v.cpus = 2
#     end
#     <TEMPLATE>.vm.provider "hyperv" do |hv|
#       hv.maxmemory = 2048
#       hv.cpus = 2
#     end
#     <TEMPLATE>.vm.provision "join_domain", type: "chef_solo", run: "once" do |chef| chef.add_recipe "recipe[cs_lab::join_domain]" end
#     <TEMPLATE>.vm.provision 'shell', reboot: true
#   end

end
