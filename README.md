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
