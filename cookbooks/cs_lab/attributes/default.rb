# Windows Features for each function (AD, DHCP, DNS, etc)

default['WF_ADDS'] = %w(
  AD-Domain-Services
  GPMC
)

default['WF_DHCP'] = [
  'DHCP',
]

default['WF_DNS'] = [
  'DNS',
]

default['WF_ADCS'] = %w(
  AD-Certificate
  ADCS-Enroll-Web-Svc
  ADCS-Web-Enrollment
  ADCS-Cert-Authority
)

default['DC_PSPackages'] = %w(
  ActiveDirectoryDsc
  ActiveDirectoryCSDsc
  ADCSTemplate
  ComputerManagementDsc
  DnsServerDsc
  NetworkingDsc
  StorageDsc
  xDhcpServer
  xPSDesiredStateConfiguration
)

default['ADJoin_PSPackages'] = %w(
  ComputerManagementDsc
  NetworkingDsc
)

default['SQL_PSPackages'] = %w(
  SqlServerDsc
  StorageDsc
)

default['WF_ADMIN'] = %w(
  RSAT-AD-Tools
  RSAT-ADCS
  RSAT-DHCP
  RSAT-DNS-Server
)

default['SiteData'] = {

  # Common Variables
  'Network' => {
    'Network' => '172.31.10', # This is the first three octets of your lab network.
    'Subnet' => '255.255.255.0',
  },

  'DefaultPassword' => 'Cyb3rS0lv3!', # This password will be the default password for any accounts

  # Domain Information
  'ADDomain' => {
    'DomainFQDN' => 'cybersolve.lab',
    'DomainShort' => 'CYBERSOLVE',
    'DomainDN' => 'DC=cybersolve,DC=lab',
  },

  # DHCP Information
  'DHCP' => {
    'IPStart' => '100',
    'IPEnd' => '150',
    'Name' => 'CyberSolve-Site',
  },

  # DNS Forwarder Information
  'DNS' => {
    'Forwarders' => [ '8.8.8.8' ],
  },
  'ADOU' => [
    {
      'Name' => 'Domain Users',
      'Path' => 'DC=cybersolve,DC=lab',
      'Description' => 'Domain Users',
    },
    {
      'Name' => 'Service Accounts',
      'Path' => 'OU=Domain Users,DC=cybersolve,DC=lab',
      'Description' => 'Service Accounts',
    },
    {
      'Name' => 'Privileged Accounts',
      'Path' => 'OU=Domain Users,DC=cybersolve,DC=lab',
      'Description' => 'Privileged Accounts',
    },
    {
      'Name' => 'Domain Groups',
      'Path' => 'DC=cybersolve,DC=lab',
      'Description' => 'Domain Groups',
    },
  ],
  'ADGroups' => [
    {
      'GroupName' => 'GSG-SQL-SQL Administrators',
      'Path' => 'OU=Domain Groups,DC=cybersolve,DC=lab',
      'Description' => 'Will provide SA access on SQL instances',
      'Members' => ['svc_ss_app'],
    },
    {
      'GroupName' => 'GSG-SS-Role-Users',
      'Path' => 'OU=Domain Groups,DC=cybersolve,DC=lab',
      'Description' => 'Will provide membership to the Users role in Secret Server',
    },
    {
      'GroupName' => 'GSG-SS-Role-Administrators',
      'Path' => 'OU=Domain Groups,DC=cybersolve,DC=lab',
      'Description' => 'Will provide membership to the Administrators role in Secret Server',
    },
    {
      'GroupName' => 'GSG-SS-Role-Unlimited Admin',
      'Path' => 'OU=Domain Groups,DC=cybersolve,DC=lab',
      'Description' => 'Will provide membership to the Unlimited Admin role in Secret Server',
    },
    {
      'GroupName' => 'Domain Admins',
      'Path' => 'CN=Users,DC=cybersolve,DC=lab',
      'Members' => ['svc_ss_app', 'awong-a', 'hconrad-a', 'hfarnsworth-a', 'jzoidberg-a', 'pfry-a'],
    },
    {
      'GroupName' => 'GSG-Web Administrators',
      'Path' => 'OU=Domain Groups,DC=cybersolve,DC=lab',
      'Description' => 'Members of this group belong to the Website Administration Team',
      'Members' => ['jzoidberg'],
    }
  ],
  'ADUsers' => [
    {
      'UserName' => 'svc_ss_app',
      'Path' => 'OU=Service Accounts,OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'svc_ss_discovery',
      'Path' => 'OU=Service Accounts,OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'svc_ss_rpc',
      'Path' => 'OU=Service Accounts,OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'awong',
      'Path' => 'OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'hconrad',
      'Path' => 'OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'hfarnsworth',
      'Path' => 'OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'jzoidberg',
      'Path' => 'OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'pfry',
      'Path' => 'OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'awong-a',
      'Path' => 'OU=Privileged Accounts,OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'hconrad-a',
      'Path' => 'OU=Privileged Accounts,OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'hfarnsworth-a',
      'Path' => 'OU=Privileged Accounts,OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'jzoidberg-a',
      'Path' => 'OU=Privileged Accounts,OU=Domain Users,DC=cybersolve,DC=lab',
    },
    {
      'UserName' => 'pfry-a',
      'Path' => 'OU=Privileged Accounts,OU=Domain Users,DC=cybersolve,DC=lab',
    },
  ],
  'SQL' => {
    'SQLDownloadURL' => 'https://go.microsoft.com/fwlink/p/?linkid=2215158&clcid=0x409&culture=en-us&country=us',
    'SMSDownloadURL' => 'https://aka.ms/ssmsfullsetup',
    'Instances' => %w(
     SecretServer 
    ),
    'SQLAdministrators' => [
      # "#{node['SiteData']['ADDomain']['DomainShort']}\\Administrator",
      # "#{node['SiteData']['ADDomain']['DomainShort']}\\GSG-SQL-SQL Administrators"
      'cybersolve\administrator',
      'cybersolve\GSG-SQL-SQL Administrators',
    ],
  },
}
