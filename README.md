# Quick instructions!

Install latest stable version of:
- [Vagrant](https://vagrantup.com)
- [VirtualBox](https://virtualbox.org)

After installing Vagrant, the 'vagrant-reload' plugin needs to be installed.

```
vagrant plugin install vagrant-reload
```

List of things this does! (This is not an extensive list!)
- Builds 3 boxen
  - DC (Server 2022 Core)
    - Holds a domain controller, DHCP, DNS, Certificate Authority
  - Admin (Server 2022 Desktop)
    - Will be for various tools and assorted "whatnot"
  - SQL (Server 2022 Core)
    - SQL Server 2022
  - Util (Server 2022 Desktop)
    - Used for utilities needed in the lab
	
Check out the files in cookbooks/cs_lab/recipies for the recipies. You can change SOME settings in cookbooks/cs_lab/attributes/default.rb, but don't go making too many changes.
