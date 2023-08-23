#
# Cookbook:: cs_lab
# Recipe:: deploy_dc
#
# Copyright:: 2023, Dave Kettmann, All Rights Reserved.

# AD Certificate Store
node['WF_ADCS'].each do |feature|
  dsc_resource "WF_#{feature}" do
    resource :windowsfeature
    property :ensure, 'Present'
    property :name, feature
  end
end

dsc_resource 'CertificationAuthority' do
  resource :adcscertificationauthority
  property :issingleinstance, 'Yes'
  property :ensure, 'Present'
  property :credential, ps_credential('vagrant', 'vagrant')
  property :catype, 'EnterpriseRootCA'
end

node['SiteData']['ADOU'].each do |ou|
  dsc_resource "ADOU_#{ou['Name']}" do
    resource :adorganizationalunit
    property :name, ou['Name']
    property :path, ou['Path']
    property :description, ou['Description']
    property :ensure, 'Present'
  end
end

node['SiteData']['ADGroups'].each do |group|
  dsc_resource "ADGroups_#{group['GroupName']}" do
    resource :adgroup
    property :groupname, group['GroupName']
    property :path, group['Path']
    property :description, group['Description']
    property :ensure, 'Present'
  end
end
