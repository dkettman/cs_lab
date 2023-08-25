# Overview
Essentially, each section below will be OS-specific instructions of the following high-level steps:
* Install Software
  * VirtualBox
  * Vagrant
    * vagrant-reload plugin
* Clone Repository
* Bring Up VMs
* ???
* Profit!
# Git
Git has been around for a long while and has taken over as one of the largest VCS (Version Control System) suites out there. If you aren't aware, it tracks changes between commits of software. This is very helpful in the software development process as it allows you to create 'checkpoints' in your code. As this project started from nothing and has become what it is today, I have been committing to GitHub in order to have a centralized place to store my code while also keeping track of how it has changed over time.
# Windows Specifics
1. Head over to (https://www.virtualbox.org/wiki/Downloads) and download the latest stable version of VirtualBox for Windows. Scroll down a little bit and find the corresponding VirtualBox Extensions Pack. This is OS-agnostic so there is just one download for all platforms. It enables a lot of the hooks Vagrant uses to manipulate the VMs.
   1. There are no special options required for install.
2. Next is Vagrant. Go to (https://developer.hashicorp.com/vagrant/downloads) and download the latest stable version for Windows. Install Vagrant using the default settings.
   1. Once Vagrant is installed, there is a plugin that needs to be installed. After the installation of Vagrant is complete, open a PowerShell window and make sure Vagrant is in your path by just running `vagrant`. It should spit out some help text. If not, check that Vagrant was installed properly and is in your PATH environment variable. 
   2. To install the plugin, simply run `vagrant install plugin vagrant-reload`. This will reach out to the Vagrant repositories and find the `vagrant-reload` plugin and download the latest version.
3. For this part, you *might* need to go out and download a Git client. You can go for the original at (https://www.git-scm.com). If you have VSCode installed, you can use that to grab the repository. There are many many Git clients now, choose one that suits you. If you aren't sure, go for the original and follow along. I will be providing commands for the standard Git CLI. Once you have your Git client downloaded, open PowerShell and find a directory that Vagrant can work out of. When we run our first Git command, it is going to create a directory and Vagrant will also store (some) data here. It is mostly metadata about the boxes and their states. This directory will be our Working Directory.
   1. First, we will need to 'clone' the repository. This can be done with:
   ```git clone https://github.com/dkettman/cs_lab```
   This will download a copy of the repository. My working directory is about 38kb, it will take only a moment for it to clone the repository.
      1. To dig just a touch deeper, "cloning the repository" is essentially downloading the latest version that was committed to the repository.
   
# Linux Specifics
1. Head over to (https://www.virtualbox.org/wiki/Downloads) and download the latest stable version of VirtualBox for Linux. Scroll down a little bit and find the corresponding VirtualBox Extensions Pack. This is OS-agnostic so there is just one download for all platforms. It enables a lot of the hooks Vagrant uses to manipulate the VMs.
   1. Your mileage may vary if you use your distribution's VirtualBox.
2. Next is Vagrant. Go to (https://developer.hashicorp.com/vagrant/downloads) and download the latest stable version for your distribution. Install Vagrant using the default settings. Do not use your OS provided package for Vagrant. 
   1. Once Vagrant is installed, there is a plugin that needs to be installed. After the installation of Vagrant is complete, open a shell and make sure Vagrant is in your path by just running `vagrant`. It should spit out some help text. If not, check that Vagrant was installed properly and is in your PATH environment variable. 
   2. To install the plugin, simply run `vagrant install plugin vagrant-reload`. This will reach out to the Vagrant repositories and find the `vagrant-reload` plugin and download the latest version.
3. For this part, you *might* need to go out and download a Git client. For Git, you can feel free to use your OS provided package. You can go for the original at (https://www.git-scm.com). I will be providing commands for the standard Git CLI. Once you have your Git client downloaded, open a shell and find a directory that Vagrant can work out of. When we run our first Git command, it is going to create a directory and Vagrant will also store (some) data here. It is mostly metadata about the boxes and their states. This directory will be our Working Directory.
   1. First, we will need to 'clone' the repository. This can be done with:
   ```git clone https://github.com/dkettman/cs_lab```
   This will download a copy of the repository. My working directory is about 38kb, it will take only a moment for it to clone the repository.
      1. To dig just a touch deeper, "cloning the repository" is essentially downloading the latest version that was committed to the repository.

# MacOS
TO BE DETERMINED. Realistically, grab Vagrant and Virtualbox from the web pages above. You can probably use `brew` to get a git client.

# All Skate!
1. Once cloned, all that is left is to bring up the lab. This can be done by simply running:
   ```vagrant up```
   This is where the magic happens! Vagrant is going to do this for each box defined:
   1. Make sure the _box_ is already downloaded. This is the specially built VirtualBox VM that Vagrant can manage.
   2. Clone the _box_ to our first VM in the list (*dc* in this case)
   3. Make sure the box comes up and that Vagrant can connect to it
   4. Runs Provisioners. In our case, this is Chef (and the vagrant-reload plugin we downloaded earlier).
   5. Barring any errors (it will continue on warnings) it will move on to the next box and continue down the line.

# Aw man! My Vagrant's busted!
Fear not!

If something goes wrong, it will probably fall into one of a few categories:
## Ruby error
Looks like this:
```ruby
C:/HashiCorp/Vagrant/embedded/gems/gems/log4r-1.1.10/lib/log4r/logger.rb:28: warning: Exception in finalizer #<Tempfile::Remover:0x070ca4d4 @pid=29508, @tmpfile=#<File:C:/Users/Work/AppData/Local/Temp/vagrant-load-metadata20230825-29508-wqwrcd (closed)>>
C:/HashiCorp/Vagrant/embedded/mingw32/lib/ruby/3.1.0/tempfile.rb:265:in `unlink': Permission denied @ apply2files - C:/Users/Work/AppData/Local/Temp/vagrant-load-metadata20230825-29508-wqwrcd (Errno::EACCES)
        from C:/HashiCorp/Vagrant/embedded/mingw32/lib/ruby/3.1.0/tempfile.rb:265:in `call'
        from C:/HashiCorp/Vagrant/embedded/gems/gems/log4r-1.1.10/lib/log4r/logger.rb:28:in `initialize'
        from C:/HashiCorp/Vagrant/embedded/gems/gems/vagrant-2.3.8.dev/lib/vagrant/action/builder.rb:72:in `new'
        from C:/HashiCorp/Vagrant/embedded/gems/gems/vagrant-2.3.8.dev/lib/vagrant/action/builder.rb:72:in `initialize'
```
Generally, these can be ignored. Vagrant is great about catching irrepairable errors. They are just warnings and are fine to ignore.

## Chef error
Looks like this:
```chef
Chef error here
```
These are an issue with the provisioning of the box. This means that Chef did not configure everything all the way or properly. If this happens, run:
```vagrant provision <box>```
This will signal Vagrant to make sure the machine is booted, then run thru all of the Provisioning steps defined in the Vagrant file for that machine. For the Domain Controller (dc) that means making sure the domain is setup, DHCP, DNS, and the Certificate Authority are all setup and running. For the others, it will ensure it is joined to the domain (on the dc box). This will reboot the boxes as needed at a couple points thru the process.

## VirtualBox issues
Sometimes, the boxes will need to be reset a little harder than just a re-provision. Something is wrong with the VM portion, it wont boot, etc. You have a couple options here. You can do `vagrant reload` which essentially just runs `vagrant halt` and then `vagrant up`. This stops the VM, then starts it again. It will not re-run any of the provisioning steps unless you provide the `--provision` flag to `vagrant reload`. 

If something else isn't working well, you can also run `vagrant destroy <box>` and that will completely delete the VM. You can then run `vagrant up <box>` and it will rebuild the VM from scratch. The problem with this, is at this time, that results in data loss. I would only use this if everything else prior to this doesn't work.

# Ok, that was enough fun, how do I get rid of it?
This will be a couple steps. First, run `vagrant destroy` this will delete each of the VMs from VirtualBox. Next is to remove the boxes. The boxes are downloaded and kept in a separate directory in case a different Vagrantfile needs them. If you would like to reclaim that space, you will need to also run `vagrant box list` to get the listing of installed boxes. Once you find the two boxes we were using, you can run `vagrant box remove <box>`.

# Final thoughts
This project brings together multiple technologies (Vagrant, VirtualBox, Chef, DSC, etc.) and the result is a pretty neat lab that can be stood up quickly across most workstations.
If you run into issues where Vagrant stores the box images, you can change the Vagrant home by updating an environment variable `VAGRANT_HOME`. See the [Vagrant Documentation](https://developer.hashicorp.com/vagrant/docs/other/environmental-variables#vagrant_home) for more details.