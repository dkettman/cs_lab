#
# Cookbook:: cs_lab
# Recipe:: install_ssms
#
# Copyright:: 2023, Dave Kettmann, All Rights Reserved.

directory 'Directory: C:\Temp' do
  path 'C:\Temp'
  action :create
end

windows_package 'SQL Server Management Studio' do
  source 'https://aka.ms/ssmsfullsetup'
  action :install
  remote_file_attributes({ path: 'C:\Temp\SSMS-Setup-ENU.exe' })
  options '/Install /Quiet'
end
