#
# Cookbook:: cs_lab
# Recipe:: join_domain
#
# Copyright:: 2023, Dave Kettmann, All Rights Reserved.

dsc_resource 'Join domain: #{node['SiteData']['ADDomain']['DomainFQDN']}' do
  resource :computer
  property :domainname, node['SiteData']['ADDomain']['DomainFQDN']
  property :credential, ps_credential('vagrant','vagrant')
  property :name, node['cs_name']
end
