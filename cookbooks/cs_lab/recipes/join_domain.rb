#
# Cookbook:: cs_lab
# Recipe:: join_domain
#
# Copyright:: 2023, Dave Kettmann, All Rights Reserved.

node['ADJoin_PSPackages'].each do |package|
  powershell_package package do
    action :install
  end
end

node['network']['interfaces'].each do |eth|
  dsc_resource "DNS: #{eth[1]['instance']['net_connection_id']}" do
    resource :dnsserveraddress
    property :address, ['172.31.10.10']
    property :interfacealias, eth[1]['instance']['net_connection_id']
    property :addressfamily, 'IPv4'
    property :validate, false
  end
end

dsc_resource "Join domain: #{node['SiteData']['ADDomain']['DomainFQDN']}" do
  resource :computer
  property :domainname, node['SiteData']['ADDomain']['DomainFQDN']
  property :credential, ps_credential("#{node['SiteData']['ADDomain']['DomainShort']}\\vagrant", 'vagrant')
  property :name, node['hostname']
end

%w(Public Private Domain).each do |profile|
  dsc_resource "FW: #{profile}" do
    resource :firewallprofile
    property :name, profile
    property :enabled, 'False'
  end
end

powershell_script 'Reset Local Administrator Password' do
  code <<-EOH
  Get-LocalUser -Name "Administrator" | Set-LocalUser -Password (ConvertTo-SecureString -String #{node['SiteData']['DefaultPassword']} -AsPlainText -Force)
  EOH
end