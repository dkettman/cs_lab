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

# Tested Providers
| Provider | OS | Tested |
| ---------|----|--------|
| VirtualBox | Linux | ✅ |
| VirtualBox | Windows 10 | ✅ |
| Hyper-V | Windows 10 | ✳ |

In theory, this Vagrantfile should work on Virtualbox, Hyper-V, and VMware Workstation. I do not have VMware Workstation available to me, so I have not tested it. Hyper-V needs the network configuration worked out, but the VMs all install correctly and seem to work alright.


# Re-Provisioning
If you need to completely start over, you can run:
```
vagrant destroy --force
```
This command will delete all of the boxen that were created and are currently built. This *WILL NOT* delete the base boxen that are downloaded as part of the `vagrant up` process.

If you need to delete and rebuild a specific box, you can use:
```
vagrant destroy <box_name> --force
```
This will delete that single box from the environment. You can quickly re-build and re-provision it by running:
```
vagrant up <box_name>
```

If you would like to just re-run the provisioning because a recipe was updated or any other reason, just re-provision it without rebuilding:
```
vagrant provision <box_name>
```

# Clean up!
If you want to completely rip all of this out, run the following commands, these **should** work for any provider.
```
vagrant destroy --force
vagrant box purge
```

This will stop and delete all VMs then remove the base boxes to free up that disk space. Note, if you remove the boxes prior to destroying the VMs, they will not boot and Vagrant will more than likely be very cross with you.

Once that is done, you can remove this repository directory. You might go directly into VirtualBox or Hyper-V and make sure everything is cleaned up, but it should be fine.