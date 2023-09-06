#
# Cookbook:: cs_lab
# Recipe:: deploy_dc
#
# Copyright:: 2023, Dave Kettmann, All Rights Reserved.

# DSC Powershell Packages
node['DC_PSPackages'].each do |package|
  powershell_package package do
    action :install
  end
end

# Active Directory
node['WF_ADDS'].each do |feature|
  dsc_resource "WF_#{feature}" do
    resource :windowsfeature
    property :ensure, 'Present'
    property :name, feature
  end
end

dsc_resource node['SiteData']['ADDomain']['DomainFQDN'] do
  resource :addomain
  property :credential, ps_credential('vagrant', 'vagrant')
  property :safemodeadministratorpassword, ps_credential(node['SiteData']['DefaultPassword'])
  property :forestmode, 'WinThreshold'
  property :domainname, node['SiteData']['ADDomain']['DomainFQDN']
  property :domainnetbiosname, node['SiteData']['ADDomain']['DomainShort']
end

# DNS
node['WF_DNS'].each do |feature|
  dsc_resource "WF_#{feature}" do
    resource :windowsfeature
    property :ensure, 'Present'
    property :name, feature
  end
end

dsc_resource 'SetForwarder' do
  resource :dnsserverforwarder
  property :issingleinstance, 'Yes'
  property :ipaddresses, node['SiteData']['DNSForwarder']
end

ruby_block 'Fix User Permissions' do
  block do
    Chef::ReservedNames::Win32::Security.add_account_right('vagrant', 'SeAssignPrimaryTokenPrivilege')
  end
end
  
    