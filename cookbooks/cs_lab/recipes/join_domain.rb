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

dsc_resource "DNS: 172.31.10.10" do
  resource :dnsserveraddress
  property :address, ['172.31.10.10']
  property :interfacealias, 'Ethernet 2'
  property :addressfamily, 'IPv4'
  property :validate, true
end

dsc_resource "Join domain: #{node['SiteData']['ADDomain']['DomainFQDN']}" do
  resource :computer
  property :domainname, node['SiteData']['ADDomain']['DomainFQDN']
  property :credential, ps_credential("#{node['SiteData']['ADDomain']['DomainShort']}\\vagrant",'vagrant')
  property :options, ["InstallInvoke"]
  property :name, node['hostname'] 
end

['Public','Private','Domain'].each do |profile|
  dsc_resource "FW: #{profile}" do
    resource :firewallprofile
    property :name, profile
    property :enabled, "False"
  end
end

