# Run Logs!
Here you will find example run logs for each box. I'll try to keep them updated.

# DC
<details>

<summary>Domain Controller `vagrant up` log</summary>

```
PS D:\users\work\Documents\repos\cs_lab> vagrant up dc
Bringing machine 'dc' up with 'virtualbox' provider...
==> dc: Preparing master VM for linked clones...
    dc: This is a one time operation. Once the master VM is prepared,
    dc: it will be used as a base for linked clones, making the creation
    dc: of new VMs take milliseconds on a modern system.
==> dc: Importing base box 'gusztavvargadr/windows-server-core'...
==> dc: Cloning VM...
==> dc: Matching MAC address for NAT networking...
==> dc: Checking if box 'gusztavvargadr/windows-server-core' version '2102.0.2308' is up to date...
==> dc: Setting the name of the VM: cs_lab_dc_1693000530386_34816
==> dc: Using hostname "dc" as node name for Chef...
==> dc: Using hostname "dc" as node name for Chef...
==> dc: Clearing any previously set network interfaces...
==> dc: Preparing network interfaces based on configuration...
    dc: Adapter 1: nat
    dc: Adapter 2: intnet
==> dc: Forwarding ports...
    dc: 3389 (guest) => 53389 (host) (adapter 1)
    dc: 5985 (guest) => 55985 (host) (adapter 1)
    dc: 5986 (guest) => 55986 (host) (adapter 1)
    dc: 22 (guest) => 2222 (host) (adapter 1)
==> dc: Running 'pre-boot' VM customizations...
==> dc: Booting VM...
==> dc: Waiting for machine to boot. This may take a few minutes...
    dc: WinRM address: 127.0.0.1:55985
    dc: WinRM username: vagrant
    dc: WinRM execution_time_limit: PT2H
    dc: WinRM transport: plaintext
==> dc: Machine booted and ready!
==> dc: Setting hostname...
==> dc: Waiting for machine to reboot...
==> dc: Configuring and enabling network interfaces...
==> dc: Mounting shared folders...
    dc: /vagrant => D:/Users/Work/Documents/repos/cs_lab
    dc: C:/vagrant-chef/123b987e971397bea926f60248e5ff51/cookbooks => D:/Users/Work/Documents/repos/cs_lab/cookbooks
==> dc: Running provisioner: chef_solo...
==> dc: Detected Chef (latest) is already installed
==> dc: Generating chef JSON and uploading...
==> dc: Running chef-solo...
==> dc: [2023-08-25T21:58:53+00:00] INFO: Persisting a license for Chef Infra Client at path C:/Users/vagrant/.chef/accepted_licenses/chef_infra_client
==> dc: [2023-08-25T21:58:53+00:00] INFO: Persisting a license for Chef InSpec at path C:/Users/vagrant/.chef/accepted_licenses/inspec
==> dc: [2023-08-25T21:58:54+00:00] INFO: Started Chef Infra Zero at chefzero://localhost:1 with repository at C:/vagrant-chef/123b987e971397bea926f60248e5ff51, C:/vagrant-chef (One version per cookbook)
==> dc: Chef Infra Client, version 18.2.7
==> dc: Patents: https://www.chef.io/patents
==> dc: Infra Phase starting
==> dc: [2023-08-25T21:58:54+00:00] INFO: *** Chef Infra Client 18.2.7 ***
==> dc: [2023-08-25T21:58:54+00:00] INFO: Platform: x64-mingw-ucrt
==> dc: [2023-08-25T21:58:54+00:00] INFO: Chef-client pid: 2888
==> dc: [2023-08-25T21:59:04+00:00] INFO: Setting the run_list to ["recipe[cs_lab::deploy_dc]"] from CLI options
==> dc: [2023-08-25T21:59:04+00:00] INFO: Run List is [recipe[cs_lab::deploy_dc]]
==> dc: [2023-08-25T21:59:04+00:00] INFO: Run List expands to [cs_lab::deploy_dc]
==> dc: [2023-08-25T21:59:04+00:00] INFO: Starting Chef Infra Client Run for dc
==> dc: [2023-08-25T21:59:04+00:00] INFO: Running start handlers
==> dc: [2023-08-25T21:59:04+00:00] INFO: Start handlers complete.
==> dc: Resolving cookbooks for run list: ["cs_lab::deploy_dc"]
==> dc: [2023-08-25T21:59:06+00:00] INFO: Loading cookbooks [cs_lab@0.1.0]
==> dc: Synchronizing cookbooks:
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/attributes/default.rb in the cache.
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/chefignore in the cache.
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/metadata.rb in the cache.
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/recipes/deploy_dns.rb in the cache.
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/LICENSE in the cache.
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/README.md in the cache.
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/recipes/deploy_dhcp.rb in the cache.
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/recipes/deploy_ad.rb in the cache.
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/recipes/deploy_dc.rb in the cache.
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/recipes/install_sql.rb in the cache.
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/recipes/install_ssms.rb in the cache.
==> dc: [2023-08-25T21:59:06+00:00] INFO: Storing updated cookbooks/cs_lab/recipes/join_domain.rb in the cache.
==> dc:   - cs_lab (0.1.0)
==> dc: Installing cookbook gem dependencies:
==> dc: Compiling cookbooks...
==> dc: Loading Chef InSpec profile files:
==> dc: Loading Chef InSpec input files:
==> dc: Loading Chef InSpec waiver files:
==> dc: Converging 13 resources
==> dc: Recipe: cs_lab::deploy_dc
==> dc:   * powershell_package[ActiveDirectoryDsc] action install
==> dc:     - install version 6.3.0 of package ActiveDirectoryDsc
==> dc:   * powershell_package[ActiveDirectoryCSDsc] action install
==> dc:     - install version 5.0.0 of package ActiveDirectoryCSDsc
==> dc:   * powershell_package[ComputerManagementDsc] action install
==> dc:     - install version 9.0.0 of package ComputerManagementDsc
==> dc:   * powershell_package[DnsServerDsc] action install
==> dc:     - install version 3.0.0 of package DnsServerDsc
==> dc:   * powershell_package[NetworkingDsc] action install
==> dc:     - install version 9.0.0 of package NetworkingDsc
==> dc:   * powershell_package[StorageDsc] action install
==> dc:     - install version 5.1.0 of package StorageDsc
==> dc:   * powershell_package[xDhcpServer] action install
==> dc:     - install version 3.1.1 of package xDhcpServer
==> dc:   * powershell_package[xPSDesiredStateConfiguration] action install
==> dc:     - install version 9.1.0 of package xPSDesiredStateConfiguration
==> dc:   * dsc_resource[WF_AD-Domain-Services] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' started: AD-Domain-Services
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' succeeded: AD-Domain-Services
==> dc:     [DC]: LCM:  [ End    Test     ]  [[WindowsFeature]DirectResourceAccess] False in 1.5480 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  4.1550 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 4.947 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Continue with installation?
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Successfully installed the feature AD-Domain-Services.
==> dc:     [DC]: LCM:  [ End    Set      ]  [[WindowsFeature]DirectResourceAccess]  in 22.5040 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  22.5590 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 22.669 seconds
==> dc:   * dsc_resource[WF_GPMC] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' started: GPMC
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' succeeded: GPMC
==> dc:     [DC]: LCM:  [ End    Test     ]  [[WindowsFeature]DirectResourceAccess] False in 0.6500 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.6740 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.828 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Continue with installation?
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Successfully installed the feature GPMC.
==> dc:     [DC]: LCM:  [ End    Set      ]  [[WindowsFeature]DirectResourceAccess]  in 12.6360 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  12.6360 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 12.72 seconds
==> dc:   * dsc_resource[cybersolve.lab] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[ADDomain]DirectResourceAccess]
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] The domain 'cybersolve.lab' is NOT in the desired state. (ADD0009)
==> dc:     [DC]: LCM:  [ End    Test     ]  [[ADDomain]DirectResourceAccess] False in 0.1870 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.8510 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.98 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[ADDomain]DirectResourceAccess]
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] Creating AD forest 'cybersolve.lab'. (ADD0006)
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] Active Directory Domain Services Setup
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] Validating environment and parameters...
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] ----------------------------------------
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] The following actions will be performed:
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] Configure this server as the first Active Directory domain controller in a new forest.
==> dc:
==> dc:     The new domain name is "cybersolve.lab". This is also the name of the new forest.
==> dc:
==> dc:     The NetBIOS name of the domain is "CYBERSOLVE".
==> dc:
==> dc:     Forest Functional Level: Windows Server 2022
==> dc:
==> dc:     Domain Functional Level: Windows Server 2022
==> dc:
==> dc:     Site: Default-First-Site-Name
==> dc:
==> dc:     Additional Options:
==> dc:       Read-only domain controller: "No"
==> dc:       Global catalog: Yes
==> dc:       DNS Server: Yes
==> dc:
==> dc:     Create DNS Delegation: No
==> dc:
==> dc:     Database folder: C:\Windows\NTDS
==> dc:     Log file folder: C:\Windows\NTDS
==> dc:     SYSVOL folder: C:\Windows\SYSVOL
==> dc:
==> dc:     The DNS Server service will be installed on this computer.
==> dc:     The DNS Server service will be configured on this computer.
==> dc:     This computer will be configured to use this DNS server as its preferred DNS server.
==> dc:
==> dc:     The password of the new domain Administrator will be the same as the password of the local Administrator of this computer.
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] ----------------------------------------
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] Active Directory Domain Services Setup
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] Validating environment and parameters...
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] ----------------------------------------
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] The following actions will be performed:
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] Configure this server as the first Active Directory domain controller in a new forest.
==> dc:
==> dc:     The new domain name is "cybersolve.lab". This is also the name of the new forest.
==> dc:
==> dc:     The NetBIOS name of the domain is "CYBERSOLVE".
==> dc:
==> dc:     Forest Functional Level: Windows Server 2022
==> dc:
==> dc:     Domain Functional Level: Windows Server 2022
==> dc:
==> dc:     Site: Default-First-Site-Name
==> dc:
==> dc:     Additional Options:
==> dc:       Read-only domain controller: "No"
==> dc:       Global catalog: Yes
==> dc:       DNS Server: Yes
==> dc:
==> dc:     Create DNS Delegation: No
==> dc:
==> dc:     Database folder: C:\Windows\NTDS
==> dc:     Log file folder: C:\Windows\NTDS
==> dc:     SYSVOL folder: C:\Windows\SYSVOL
==> dc:
==> dc:     The DNS Server service will be installed on this computer.
==> dc:     The DNS Server service will be configured on this computer.
==> dc:     This computer will be configured to use this DNS server as its preferred DNS server.
==> dc:
==> dc:     The password of the new domain Administrator will be the same as the password of the local Administrator of this computer.
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] ----------------------------------------
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] Press CTRL-C to: Cancel
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] Active Directory Domain Services is now installed on this computer for the domain "cybersolve.lab".
==> dc:
==> dc:     This Active Directory domain controller is assigned to the site "Default-First-Site-Name". You can manage sites with the Active Directory Sites and Services administrative tool.
==> dc:     [DC]:                            [[ADDomain]DirectResourceAccess] AD forest 'cybersolve.lab' created. (ADD0007)
==> dc:     [DC]: LCM:  [ End    Set      ]  [[ADDomain]DirectResourceAccess]  in 76.7570 seconds.
==> dc:     [DC]:                            [] A reboot is required to progress further. Please reboot the system.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  76.7570 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 76.731 seconds
==> dc:   * dsc_resource[WF_DNS] action run
==> dc:   * dsc_resource[SetForwarder] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[DnsServerForwarder]DirectResourceAccess]
==> dc:     [DC]:                            [[DnsServerForwarder]DirectResourceAccess] Validate IP addresses.
==> dc:     [DC]:                            [[DnsServerForwarder]DirectResourceAccess] Getting current DNS forwarders.
==> dc:     [DC]: LCM:  [ End    Test     ]  [[DnsServerForwarder]DirectResourceAccess] False in 3.7400 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  4.0010 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 4.13 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[DnsServerForwarder]DirectResourceAccess]
==> dc:     [DC]: LCM:  [ End    Set      ]  [[DnsServerForwarder]DirectResourceAccess]  in 0.0000 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.0340 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.113 seconds
==> dc: [2023-08-25T22:02:07+00:00] INFO: Chef Infra Client Run complete in 182.7473829 seconds
==> dc: Running handlers:
==> dc: [2023-08-25T22:02:07+00:00] INFO: Running report handlers
==> dc: Running handlers complete
==> dc: [2023-08-25T22:02:07+00:00] INFO: Report handlers complete
==> dc: Infra Phase complete, 12/13 resources updated in 03 minutes 12 seconds
==> dc: Running provisioner: reload...
==> dc: Attempting graceful shutdown of VM...
==> dc: Checking if box 'gusztavvargadr/windows-server-core' version '2102.0.2308' is up to date...
==> dc: Clearing any previously set forwarded ports...
==> dc: Clearing any previously set network interfaces...
==> dc: Preparing network interfaces based on configuration...
    dc: Adapter 1: nat
    dc: Adapter 2: intnet
==> dc: Forwarding ports...
    dc: 3389 (guest) => 53389 (host) (adapter 1)
    dc: 5985 (guest) => 55985 (host) (adapter 1)
    dc: 5986 (guest) => 55986 (host) (adapter 1)
    dc: 22 (guest) => 2222 (host) (adapter 1)
==> dc: Running 'pre-boot' VM customizations...
==> dc: Booting VM...
==> dc: Waiting for machine to boot. This may take a few minutes...
    dc: WinRM address: 127.0.0.1:55985
    dc: WinRM username: vagrant
    dc: WinRM execution_time_limit: PT2H
    dc: WinRM transport: plaintext
==> dc: Machine booted and ready!
==> dc: Setting hostname...
==> dc: Configuring and enabling network interfaces...
==> dc: Mounting shared folders...
    dc: /vagrant => D:/Users/Work/Documents/repos/cs_lab
    dc: C:/vagrant-chef/123b987e971397bea926f60248e5ff51/cookbooks => D:/Users/Work/Documents/repos/cs_lab/cookbooks
==> dc: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> dc: flag to force provisioning. Provisioners marked to run always will still run.
==> dc: Running provisioner: chef_solo...
==> dc: Detected Chef (latest) is already installed
==> dc: Generating chef JSON and uploading...
==> dc: Running chef-solo...
==> dc: [2023-08-25T22:04:32+00:00] INFO: Started Chef Infra Zero at chefzero://localhost:1 with repository at C:/vagrant-chef/123b987e971397bea926f60248e5ff51, C:/vagrant-chef (One version per cookbook)
==> dc: Chef Infra Client, version 18.2.7
==> dc: Patents: https://www.chef.io/patents
==> dc: Infra Phase starting
==> dc: [2023-08-25T22:04:32+00:00] INFO: *** Chef Infra Client 18.2.7 ***
==> dc: [2023-08-25T22:04:32+00:00] INFO: Platform: x64-mingw-ucrt
==> dc: [2023-08-25T22:04:32+00:00] INFO: Chef-client pid: 3380
==> dc: [2023-08-25T22:04:40+00:00] INFO: Setting the run_list to ["recipe[cs_lab::deploy_dhcp]", "recipe[cs_lab::deploy_ad]"] from CLI options
==> dc: [2023-08-25T22:04:40+00:00] INFO: Run List is [recipe[cs_lab::deploy_dhcp], recipe[cs_lab::deploy_ad]]
==> dc: [2023-08-25T22:04:40+00:00] INFO: Run List expands to [cs_lab::deploy_dhcp, cs_lab::deploy_ad]
==> dc: [2023-08-25T22:04:40+00:00] INFO: Starting Chef Infra Client Run for dc
==> dc: [2023-08-25T22:04:40+00:00] INFO: Running start handlers
==> dc: [2023-08-25T22:04:40+00:00] INFO: Start handlers complete.
==> dc: Resolving cookbooks for run list: ["cs_lab::deploy_dhcp", "cs_lab::deploy_ad"]
==> dc: [2023-08-25T22:04:40+00:00] INFO: Loading cookbooks [cs_lab@0.1.0]
==> dc: Synchronizing cookbooks:
==> dc:   - cs_lab (0.1.0)
==> dc: Installing cookbook gem dependencies:
==> dc: Compiling cookbooks...
==> dc: Loading Chef InSpec profile files:
==> dc: Loading Chef InSpec input files:
==> dc: Loading Chef InSpec waiver files:
==> dc: Converging 15 resources
==> dc: Recipe: cs_lab::deploy_dhcp
==> dc:   * dsc_resource[WF_DHCP] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' started: DHCP
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' succeeded: DHCP
==> dc:     [DC]: LCM:  [ End    Test     ]  [[WindowsFeature]DirectResourceAccess] False in 6.1080 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  8.1410 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 12.566 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Continue with installation?
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Successfully installed the feature DHCP.
==> dc:     [DC]: LCM:  [ End    Set      ]  [[WindowsFeature]DirectResourceAccess]  in 14.8380 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  14.8380 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 18.602 seconds
==> dc:   * dsc_resource[DHCPScope] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[xDhcpServerScope]DirectResourceAccess]
==> dc:     [DC]:                            [[xDhcpServerScope]DirectResourceAccess] Evaluating the server scope with scope id '172.31.10.0' if it is in the desired state.
==> dc:     [DC]:                            [[xDhcpServerScope]DirectResourceAccess] Checking DHCP server scope with the given ScopeId (172.31.10.0).
==> dc:     [DC]:                            [[xDhcpServerScope]DirectResourceAccess] DHCP server scope with the given ScopeId (172.31.10.0) is 'absent' and it should be 'Present'.
==> dc:     [DC]: LCM:  [ End    Test     ]  [[xDhcpServerScope]DirectResourceAccess] False in 1.6340 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  2.0600 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 2.477 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[xDhcpServerScope]DirectResourceAccess]
==> dc:     [DC]:                            [[xDhcpServerScope]DirectResourceAccess] Changing the server scope with scope id '172.31.10.0' to the desired state.
==> dc:     [DC]:                            [[xDhcpServerScope]DirectResourceAccess] Checking DHCP server scope with the given ScopeId (172.31.10.0).
==> dc:     [DC]:                            [[xDhcpServerScope]DirectResourceAccess] DHCP server scope with the given ScopeId (172.31.10.0) is 'absent' and it should be 'Present'.
==> dc:     [DC]:                            [[xDhcpServerScope]DirectResourceAccess] Adding DHCP server scope with the given ScopeId (172.31.10.0).
==> dc:     [DC]:                            [[xDhcpServerScope]DirectResourceAccess] DHCP server scope with name 'CyberSolve-Site' is now present.
==> dc:     [DC]: LCM:  [ End    Set      ]  [[xDhcpServerScope]DirectResourceAccess]  in 0.1200 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.1200 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.194 seconds
==> dc:   * dsc_resource[DHCPRouter] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[DhcpServerOptionValue]DirectResourceAccess]
==> dc:     [DC]:                            [[DhcpServerOptionValue]DirectResourceAccess] Getting DHCP server option value "3" with vendor class "" and user class "".
==> dc:     [DC]:                            [[DhcpServerOptionValue]DirectResourceAccess] DHCP server option value "3" with vendor class "" and user class "" not found.
==> dc:     [DC]: LCM:  [ End    Test     ]  [[DhcpServerOptionValue]DirectResourceAccess] False in 0.0100 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.1480 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.289 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[DhcpServerOptionValue]DirectResourceAccess]
==> dc:     [DC]:                            [[DhcpServerOptionValue]DirectResourceAccess] Getting DHCP server option value "3" with vendor class "" and user class "".
==> dc:     [DC]:                            [[DhcpServerOptionValue]DirectResourceAccess] Setting DHCP server option value "3" with vendor class "" and user class "".
==> dc:     [DC]: LCM:  [ End    Set      ]  [[DhcpServerOptionValue]DirectResourceAccess]  in 0.0840 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.1040 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.342 seconds
==> dc:   * dsc_resource[DHCPDns] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[DhcpServerOptionValue]DirectResourceAccess]
==> dc:     [DC]:                            [[DhcpServerOptionValue]DirectResourceAccess] Getting DHCP server option value "6" with vendor class "" and user class "".
==> dc:     [DC]:                            [[DhcpServerOptionValue]DirectResourceAccess] DHCP server option value "6" with vendor class "" and user class "" not found.
==> dc:     [DC]: LCM:  [ End    Test     ]  [[DhcpServerOptionValue]DirectResourceAccess] False in 0.0000 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.0050 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.062 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[DhcpServerOptionValue]DirectResourceAccess]
==> dc:     [DC]:                            [[DhcpServerOptionValue]DirectResourceAccess] Getting DHCP server option value "6" with vendor class "" and user class "".
==> dc:     [DC]:                            [[DhcpServerOptionValue]DirectResourceAccess] Setting DHCP server option value "6" with vendor class "" and user class "".
==> dc:     [DC]: LCM:  [ End    Set      ]  [[DhcpServerOptionValue]DirectResourceAccess]  in 0.0000 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.0060 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.067 seconds
==> dc:   * dsc_resource[DHCPAuthorization] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[xDhcpServerAuthorization]DirectResourceAccess]
==> dc:     [DC]:                            [[xDhcpServerAuthorization]DirectResourceAccess] Evaluating the server authorization for the server '' if it is in the desired state.
==> dc:     [DC]:                            [[xDhcpServerAuthorization]DirectResourceAccess] Resolving local hostname.
==> dc:     [DC]:                            [[xDhcpServerAuthorization]DirectResourceAccess] Resolving first local IPv4 IP address.
==> dc:     [DC]:                            [[xDhcpServerAuthorization]DirectResourceAccess] Perform operation 'Enumerate CimInstances' with following parameters, ''namespaceName' = root\CIMV2,'className' = Win32_NetworkAdapterConfiguration'.
==> dc:     [DC]:                            [[xDhcpServerAuthorization]DirectResourceAccess] Get the current state of the server authorization for the server ''.
==> dc:     [DC]:                            [[xDhcpServerAuthorization]DirectResourceAccess] DHCP Server 'dc.cybersolve.lab' with IP address '10.0.2.15' is NOT authorized.
==> dc:     [DC]:                            [[xDhcpServerAuthorization]DirectResourceAccess] Property 'Ensure' is incorrect. Expected 'Present', actual 'Absent'.
==> dc:     [DC]:                            [[xDhcpServerAuthorization]DirectResourceAccess] DHCP Server 'dc.cybersolve.lab' is NOT in the desired state.
==> dc:     [DC]: LCM:  [ End    Test     ]  [[xDhcpServerAuthorization]DirectResourceAccess] False in 0.2810 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.3230 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.398 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[xDhcpServerAuthorization]DirectResourceAccess]
==> dc:     [DC]:                            [[xDhcpServerAuthorization]DirectResourceAccess] Changing the server authorization for the server '' to the desired state.
==> dc:     [DC]:                            [[xDhcpServerAuthorization]DirectResourceAccess] Authorizing DHCP Server 'dc.cybersolve.lab' with IP address '10.0.2.15'.
==> dc:     [DC]: LCM:  [ End    Set      ]  [[xDhcpServerAuthorization]DirectResourceAccess]  in 0.0740 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.0740 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.127 seconds
==> dc: Recipe: cs_lab::deploy_ad
==> dc:   * dsc_resource[WF_AD-Certificate] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' started: AD-Certificate
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' succeeded: AD-Certificate
==> dc:     [DC]: LCM:  [ End    Test     ]  [[WindowsFeature]DirectResourceAccess] False in 0.1230 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.1230 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.24 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Continue with installation?
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Successfully installed the feature AD-Certificate.
==> dc:     [DC]: LCM:  [ End    Set      ]  [[WindowsFeature]DirectResourceAccess]  in 11.7230 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  11.7230 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 12.049 seconds
==> dc:   * dsc_resource[WF_ADCS-Enroll-Web-Svc] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' started: ADCS-Enroll-Web-Svc
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' succeeded: ADCS-Enroll-Web-Svc
==> dc:     [DC]: LCM:  [ End    Test     ]  [[WindowsFeature]DirectResourceAccess] False in 0.2970 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.3140 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.436 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Continue with installation?
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Successfully installed the feature ADCS-Enroll-Web-Svc.
==> dc:     [DC]: LCM:  [ End    Set      ]  [[WindowsFeature]DirectResourceAccess]  in 57.7190 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  57.7380 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 44.894 seconds
==> dc:   * dsc_resource[WF_ADCS-Web-Enrollment] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' started: ADCS-Web-Enrollment
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' succeeded: ADCS-Web-Enrollment
==> dc:     [DC]: LCM:  [ End    Test     ]  [[WindowsFeature]DirectResourceAccess] False in 0.7650 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.9760 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.759 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[WindowsFeature]DirectResourceAccess]
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Continue with installation?
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing started...
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Installation succeeded.
==> dc:     [DC]:                            [[WindowsFeature]DirectResourceAccess] Successfully installed the feature ADCS-Web-Enrollment.
==> dc:     [DC]: LCM:  [ End    Set      ]  [[WindowsFeature]DirectResourceAccess]  in 40.0530 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  40.0530 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 26.777 seconds
==> dc:   * dsc_resource[WF_ADCS-Cert-Authority] action run
==> dc:   * dsc_resource[CertificationAuthority] action run
==> dc:   * dsc_resource[ADOU_Domain Users] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[ADOrganizationalUnit]DirectResourceAccess]
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Retrieving OU 'Domain Users' from path 'DC=cybersolve,DC=lab'. (ADOU0001)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] The OU 'Domain Users' is absent. (ADOU0012)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] OU 'Domain Users' does not exist when it should exist. (ADOU0008)
==> dc:     [DC]: LCM:  [ End    Test     ]  [[ADOrganizationalUnit]DirectResourceAccess] False in 4.3640 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  4.9790 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 3.756 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[ADOrganizationalUnit]DirectResourceAccess]
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Retrieving OU 'Domain Users' from path 'DC=cybersolve,DC=lab'. (ADOU0001)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] The OU 'Domain Users' is absent. (ADOU0012)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Creating OU 'Domain Users'. (ADOU0004)
==> dc:     [DC]: LCM:  [ End    Set      ]  [[ADOrganizationalUnit]DirectResourceAccess]  in 0.3160 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.3890 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.373 seconds
==> dc:   * dsc_resource[ADOU_Service Accounts] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[ADOrganizationalUnit]DirectResourceAccess]
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Retrieving OU 'Service Accounts' from path 'OU=Domain Users,DC=cybersolve,DC=lab'. (ADOU0001)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] The OU 'Service Accounts' is absent. (ADOU0012)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] OU 'Service Accounts' does not exist when it should exist. (ADOU0008)
==> dc:     [DC]: LCM:  [ End    Test     ]  [[ADOrganizationalUnit]DirectResourceAccess] False in 0.0000 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.0000 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.067 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[ADOrganizationalUnit]DirectResourceAccess]
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Retrieving OU 'Service Accounts' from path 'OU=Domain Users,DC=cybersolve,DC=lab'. (ADOU0001)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] The OU 'Service Accounts' is absent. (ADOU0012)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Creating OU 'Service Accounts'. (ADOU0004)
==> dc:     [DC]: LCM:  [ End    Set      ]  [[ADOrganizationalUnit]DirectResourceAccess]  in 0.4230 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.4230 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.368 seconds
==> dc:   * dsc_resource[ADOU_Privileged Accounts] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[ADOrganizationalUnit]DirectResourceAccess]
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Retrieving OU 'Privileged Accounts' from path 'OU=Domain Users,DC=cybersolve,DC=lab'. (ADOU0001)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] The OU 'Privileged Accounts' is absent. (ADOU0012)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] OU 'Privileged Accounts' does not exist when it should exist. (ADOU0008)
==> dc:     [DC]: LCM:  [ End    Test     ]  [[ADOrganizationalUnit]DirectResourceAccess] False in 0.0000 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.0000 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.059 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[ADOrganizationalUnit]DirectResourceAccess]
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Retrieving OU 'Privileged Accounts' from path 'OU=Domain Users,DC=cybersolve,DC=lab'. (ADOU0001)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] The OU 'Privileged Accounts' is absent. (ADOU0012)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Creating OU 'Privileged Accounts'. (ADOU0004)
==> dc:     [DC]: LCM:  [ End    Set      ]  [[ADOrganizationalUnit]DirectResourceAccess]  in 0.0410 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.0460 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.107 seconds
==> dc:   * dsc_resource[ADOU_Domain Groups] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[ADOrganizationalUnit]DirectResourceAccess]
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Retrieving OU 'Domain Groups' from path 'DC=cybersolve,DC=lab'. (ADOU0001)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] The OU 'Domain Groups' is absent. (ADOU0012)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] OU 'Domain Groups' does not exist when it should exist. (ADOU0008)
==> dc:     [DC]: LCM:  [ End    Test     ]  [[ADOrganizationalUnit]DirectResourceAccess] False in 0.0000 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.0000 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.075 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[ADOrganizationalUnit]DirectResourceAccess]
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Retrieving OU 'Domain Groups' from path 'DC=cybersolve,DC=lab'. (ADOU0001)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] The OU 'Domain Groups' is absent. (ADOU0012)
==> dc:     [DC]:                            [[ADOrganizationalUnit]DirectResourceAccess] Creating OU 'Domain Groups'. (ADOU0004)
==> dc:     [DC]: LCM:  [ End    Set      ]  [[ADOrganizationalUnit]DirectResourceAccess]  in 0.0300 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.1260 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.17 seconds
==> dc:   * dsc_resource[ADGroups_GSG-SQL-SQL Administrators] action run
==> dc:     - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Test     ]  [[ADGroup]DirectResourceAccess]
==> dc:     [DC]:                            [[ADGroup]DirectResourceAccess] Retrieving AD Group 'GSG-SQL-SQL Administrators'. (ADG0021)
==> dc:     [DC]:                            [[ADGroup]DirectResourceAccess] The AD Group 'GSG-SQL-SQL Administrators' is absent. (ADG0024)
==> dc:     [DC]:                            [[ADGroup]DirectResourceAccess] AD Group 'GSG-SQL-SQL Administrators' does not exist but should. (ADG0016)
==> dc:     [DC]: LCM:  [ End    Test     ]  [[ADGroup]DirectResourceAccess] False in 0.1120 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.3790 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.259 seconds
==> dc:     Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' = MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.
==> dc:     An LCM method call arrived from computer DC with user sid S-1-5-21-1840812165-4232372621-3898119302-1000.
==> dc:     [DC]: LCM:  [ Start  Set      ]  [[ADGroup]DirectResourceAccess]
==> dc:     [DC]:                            [[ADGroup]DirectResourceAccess] Retrieving AD Group 'GSG-SQL-SQL Administrators'. (ADG0021)
==> dc:     [DC]:                            [[ADGroup]DirectResourceAccess] The AD Group 'GSG-SQL-SQL Administrators' is absent. (ADG0024)
==> dc:     [DC]:                            [[ADGroup]DirectResourceAccess] Creating AD Group 'GSG-SQL-SQL Administrators'. (ADG0005)
==> dc:     [DC]: LCM:  [ End    Set      ]  [[ADGroup]DirectResourceAccess]  in 0.2240 seconds.
==> dc:     [DC]: LCM:  [ End    Set      ]    in  0.2440 seconds.
==> dc:     Operation 'Invoke CimMethod' complete.
==> dc:     Time taken for configuration job to complete is 0.219 seconds
==> dc: [2023-08-25T22:07:22+00:00] INFO: Chef Infra Client Run complete in 162.0757986 seconds
==> dc: Running handlers:
==> dc: [2023-08-25T22:07:22+00:00] INFO: Running report handlers
==> dc: Running handlers complete
==> dc: [2023-08-25T22:07:22+00:00] INFO: Report handlers complete
==> dc: Infra Phase complete, 13/15 resources updated in 02 minutes 49 seconds
```
</details>