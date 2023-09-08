#
# Cookbook:: cs_lab
# Recipe:: setup_admin
#
# Copyright:: 2023, Dave Kettmann, All Rights Reserved.

node['WF_ADMIN'].each do |feature|
  dsc_resource "WF_#{feature}" do
    resource :windowsfeature
    property :ensure, 'Present'
    property :name, feature
  end
end
