#
# Cookbook:: cs_lab
# Recipe:: deploy_dc
#
# Copyright:: 2023, Dave Kettmann, All Rights Reserved.


# node['DC_PSPackages'].each do |package|
#   powershell_package package do
#     action :install
#   end
# end

["#{node['WF_ADDS']}","#{node['WF_DHCP']}","#{node['WF_DNS']}"].each do |feature|
  log "#{feature}" do
    level :info
  end
  dsc_resource "WF_#{feature}" do
    resource :windowsfeature
    property :ensure, 'Present'
    property :name, feature
  end
end

# node['WF_ADDS'].each do |feature|
#   dsc_resource "WF_#{feature}" do
#     resource :windowsfeature
#     property :ensure, 'Present'
#     property :name, feature
#   end
# end

# node['WF_DNS'].each do |feature|
#   dsc_resource "WF_#{feature}" do
#     resource :windowsfeature
#     property :ensure, 'Present'
#     property :name, feature
#   end
# end

# dsc_resource node['SiteData']['ADDomain']['DomainFQDN'] do
#   resource :addomain
#   property :credential, ps_credential('vagrant','vagrant')
#   property :safemodeadministratorpassword, ps_credential(node['SiteData']['DefaultPassword'])
#   property :forestmode, "WinThreshold"
#   property :domainname, node['SiteData']['ADDomain']['DomainFQDN']
#   property :domainnetbiosname, node['SiteData']['ADDomain']['DomainShort']
# end

# dsc_resource 'SetForwarder' do
#   resource :dnsserverforwarder
#   property :issingleinstance, 'Yes'
#   property :ipaddresses, node['SiteData']['DNSForwarder']
# end
  

