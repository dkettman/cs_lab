#
# Cookbook:: cs_lab
# Recipe:: provision_ad
#
# Copyright:: 2023, Dave Kettmann, All Rights Reserved.

node['SiteData']['ADOU'].each do |ou|
  dsc_resource "ADOU_#{ou['Name']}" do
    resource :adorganizationalunit
    property :name, ou['Name']
    property :path, ou['Path']
    property :description, ou['Description']
    property :ensure, 'Present'
  end
end

node['SiteData']['ADUsers'].each do |user|
  dsc_resource "ADUser_#{user['UserName']}" do
    resource :ADUser
    property :username, user['UserName']
    property :domainname, node['SiteData']['ADDomain']['DomainFQDN']
    property :password, ps_credential(user['UserName'], node['SiteData']['DefaultPassword'])
    property :displayname, user['UserName']
    property :path, user['Path']
    property :passwordauthentication, 'Negotiate'
    property :ensure, 'Present'
  end
end

node['SiteData']['ADGroups'].each do |group|
  dsc_resource "ADGroups_#{group['GroupName']}" do
    resource :adgroup
    property :groupname, group['GroupName']
    property :path, group['Path']
    property :description, group['Description']
    property :memberstoinclude, group['Members']
    property :ensure, 'Present'
  end
end
