#
# Cookbook:: cs_lab
# Recipe:: deploy_dc
#
# Copyright:: 2023, Dave Kettmann, All Rights Reserved.

powershell_script 'Reset Domain Administrator Password' do
  code <<-EOH
  Set-ADAccountPassword -Identity (Get-ADUser Administrator) -NewPassword (ConvertTo-SecureString -String #{node['SiteData']['DefaultPassword']} -AsPlainText -Force) -Reset
  EOH
end

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
  property :credential, ps_credential('cybersolve\administrator', node['SiteData']['DefaultPassword'])
  property :catype, 'EnterpriseRootCA'
end

powershell_script 'Deploy ADCS Certificate Template' do
  code <<-EOH
  if (!(Get-ADCSTemplate | ?{$_.DisplayName -eq "Web Server v2"})) {
    New-ADCSTemplate -DisplayName "Web Server v2" -JSON (Export-ADCSTemplate -DisplayName "Web Server") -Identity "Authenticated Users" -AutoEnroll -Publish
  }
  EOH
  domain 'cybersolve'
  user 'Administrator'
  password node['SiteData']['DefaultPassword']
end
