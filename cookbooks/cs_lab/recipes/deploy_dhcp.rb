#
# Cookbook:: cs_lab
# Recipe:: deploy_dc
#
# Copyright:: 2023, Dave Kettmann, All Rights Reserved.

# DHCP
node['WF_DHCP'].each do |feature|
  dsc_resource "WF_#{feature}" do
    resource :windowsfeature
    property :ensure, 'Present'
    property :name, feature
  end
end

dsc_resource 'DHCPScope' do
  resource :xdhcpserverscope
  property :scopeid, node['SiteData']['Network']['Network']+".0"
  property :ipstartrange, "#{node['SiteData']['Network']['Network']}.#{node['SiteData']['DHCP']['IPStart']}"
  property :ipendrange, "#{node['SiteData']['Network']['Network']}.#{node['SiteData']['DHCP']['IPEnd']}"
  property :name, node['SiteData']['DHCP']['Name']
  property :subnetmask, node['SiteData']['Network']['Subnet']
  property :leaseduration, "08:00:00" # 8 Hours
  property :state, "Active"
  property :addressfamily, 'IPv4'
end

dsc_resource 'DHCPRouter' do
  resource :dhcpserveroptionvalue
  property :optionid, 3
  property :value, ["#{node['SiteData']['Network']['Network']}.1"]
  property :vendorclass, ''
  property :userclass, ''
  property :addressfamily, 'IPv4'
  property :ensure, 'Present'
end

dsc_resource 'DHCPDns' do
  resource :dhcpserveroptionvalue
  property :optionid, 6
  property :value, ["#{node['SiteData']['Network']['Network']}.10"]
  property :vendorclass, ''
  property :userclass, ''
  property :addressfamily, 'IPv4'
  property :ensure, 'Present'
end

dsc_resource 'DHCPAuthorization' do
  resource :xdhcpserverauthorization
  property :issingleinstance, 'Yes'
  property :ensure, 'Present'
end
