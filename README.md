# Quick instructions!

Install latest stable version of:
- [Vagrant](https://vagrantup.com)
- [VirtualBox](https://virtualbox.org)

After installing Vagrant, the 'vagrant-reload' plugin needs to be installed.

```
vagrant plugin install vagrant-reload
```

Lastly, the additional storage portion of the VirtualBox Vagrant provider is still considered "Experimental". Enable this by setting the environment variable `VAGRANT_EXPERIMENTAL` to include "disks". On linux, you can do:
```
export VAGRANT_EXPERIMENTAL="disks"
```

List of things this does! (This is not an extensive list!)
- Builds 3 boxen
  - DC (Server 2022 Core)
    - Holds a domain controller, DHCP, DNS, Certificate Authority
  - Admin (Server 2022 Desktop)
    - Will be for various tools and assorted "whatnot"
  - SQL (Server 2022 Core)
    - SQL Server 2022 -- Not working yet and commented out.
	
Check out the files in cookbooks/cs_lab/recipies for the recipies. You can change SOME settings in cookbooks/cs_lab/attributes/default.rb, but don't go making too many changes.
