#
# Cookbook:: cs_lab
# Recipe:: install_sql
#
# Copyright:: 2023, Dave Kettmann, All Rights Reserved.

node['SQL_PSPackages'].each do |package|
  powershell_package package do
    action :install
  end
end

powershell_script 'Setup SQL Storage Disk' do
  code <<-EOH
$disk = Get-Disk -Number 1
if ($disk.PartitionStyle -ne "GPT") {
   $disk | Initialize-Disk -PartitionStyle GPT -PassThru | New-Volume -FileSystem NTFS -DriveLetter S -FriendlyName 'SQL'
}
EOH
  not_if '$disk = Get-Disk -Number 1 ; ($disk.PartitionStyle -eq "GPT")'
end

directory 'Directory: C:\Temp' do
  path 'C:\Temp'
  action :create
end

remote_file 'SQLInstaller' do
  source node['SiteData']['SQL']['SQLDownloadURL']
  path 'C:\Temp\SQL2022-SSEI-Dev.exe'
  use_etag true
  use_conditional_get true
end

powershell_script 'Extract SQL ISO' do
  code 'C:\Temp\SQL2022-SSEI-Dev.exe /Action=Download /MediaPath=C:\Temp\SQL /MT=ISO /q /hp'
  only_if 'Test-Path "C:\Temp\SQL2022-SSEI-Dev.exe"'
end
  
dsc_resource 'SQL: Mount ISO' do
  resource :mountimage
  property :imagepath, 'C:\Temp\SQL\SQLServer2022-x64-ENU-Dev.iso'
  property :driveletter, "I"
end

# node['SiteData']['SQL']['Instances'].each do |sql|
#   dsc_resource "SQL: Instance: #{sql}" do
#     resource :sqlsetup
#     property :sourcepath, 'I:'
#     property :features, 'SQLENGINE,FULLTEXT'
#     property :instancename, sql
#     # property :sqlsysadminaccounts, ["#{node['SiteData']['ADDomain']['DomainShort']}\\vagrant"]
#     property :sqlsysadminaccounts, 
#     property :securitymode, 'SQL'
#     property :sapwd, ps_credential(node['SiteData']['DefaultPassword'])
#     property :npenabled, true
#     property :tcpenabled, true
#   end
# end
