ruby_block 'Fix User Permissions' do
  block do
    Chef::ReservedNames::Win32::Security.add_account_right('vagrant', 'SeAssignPrimaryTokenPrivilege')
  end
end

powershell_script 'Reset Local Administrator Password' do
  code <<-EOH
    Get-LocalUser -Name "Administrator" | Set-LocalUser -Password (ConvertTo-SecureString -String #{node['SiteData']['DefaultPassword']} -AsPlainText -Force)
    EOH
  # notifies :reboot_now, 'reboot[Restart Computer]', :immediately
end
