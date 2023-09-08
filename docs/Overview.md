# Cybersolve Training Lab
## Technology
This lab is built on the technology of three components:
- [Vagrant](https://vagrantup.com)
- [VirtualBox](https://virtualbox.org)
- [Chef](https://chef.io)

These next couple sections are just blurbs about each piece above and are completely optional. As I remember hearing as a young child in a Looney Tunes cartoon, "Can't tell a player without a program!"

### Vagrant in 60 seconds (starring Nicolas Cage..?)
Vagrant was chosen for this project as the target use case is for a simple way to distribute multiple machines without carting around disk images. This is done by using what Vagrant calls a _box_. A _box_ is a specially built VM that is prepared in a way that Vagrant can access it and manage it. Mostly, it uses a specific account (vagrant) and a specific SSH key that Vagrant uses for configuration when access is needed to the _box_. Vagrant since it's inception has been built to work in-step with VirtualBox. 

### The Girl with the VirtualBox Tattoo
VirtualBox has been around a very long time (according to Wikpedia, 16 years ago!) and solves a problem that up until recently plagued Sys Admins and coders alike: Fast, easy Virtual Machines without needing to worry with a whole Hypervisor (like VMWare or Hyper-V). The people who started using it also wanted to start automating things with it (as geeks are known to do) and so Vagrant was born. Since it's release, it has been purchased by Sun Microsystems and then soon after, Oracle. Today it still is run on many machines and is still regularly updated.

### Chef (Sorry, nothing clever here...)
Chef started out as a simple configuration managment tool akin to Puppet, Ansible, and SaltStack. Like the other configuration management tools out there, this one grew up and now can manage whole infrastructures! We are just using the original part of Chef here which is now called Chef Infra (as in Infrastructure). Both Chef and Vagrant are written in Ruby and Vagrant has some really good integrations with Chef so there is nothing to setup, it is all done in the background. In this Training Lab, Chef is the real worker here. More on that later, but if you want to skip ahead a few chapters, check out the 'cookbooks/cs_lab/recipes/*.rb' and 'cookbooks/cs_lab/attributes/default.rb' files.

### A Streetcar Named Desired State Configuration
This one is sort of an honorable mention. Initially when I wanted to build this lab, I had been on a Powershell kick. Desired State Configuration (or DSC) is a Powershell-based configuration management tool built by Microsoft to manage Microsoft products. Not just Windows, but SQL, Exchange, SCCM, etc. I had put time into building out all of the required resources and testing them in my lab and they all did exactly what they were supposed to do. The problem I had was that DSC is either for one-off configuration (`Invoke-DSCResource`) or for enterprises that rely mostly on Microsoft products already. There were no good "in between" options there. In my research, I found one of three answers everywhere: 1. Microsoft has abandonded DSC, 2. Microsoft is gearing up to dominate with it in Azure, 3. It's easier to use Chef/Puppet and invoke the DSC resources. It wasn't until I started building out this iteration of the lab and learning Chef what was meant by number 3. Most of what is done in this lab is calling the `dsc_resource` resource in Chef and copying the configuration I've already done prior to Chef.

## So what does it do?
Ok, you made it through that drivel, now on to the meat and potatoes! This is going to progressively get deeper and deeper into the weeds, so proceed with caution!

After cloning this repository to your local machine, you will have the core pieces of this project:
- (Vagrantfile)
  - This file describes all of the boxes and does some base configuration along with declaring what recipes will be executed on each box.
- (cookbooks/cs_lab/recipes/)
  - Each file is a "recipe" and contains multiple resources. Each file is read in order<sup>*</sup> and executed.
    - <sup>*</sup> - If there is any bare Ruby code in the recipe, that will be executed ahead of everything else.
- (cookbooks/cs_lab/attributes/default.rb)
  - This is where any repeatable data is stored along with some configuration data. More on this later

Once cloned, one additional step needs to be completed. Initially, Chef and Vagrant were intended for Linux virtual machines. Since we are working with Windows vms, some things just don't flow as nicely as they should (of course!). We will need the `vagrant-reload` plugin. This will trigger the VM to reload and Vagrant will continue on the provisioning from there. If we try to use a Chef automated restart, Vagrant gets grumpy and causes issues. In order to install this plugin, simply run:
```vagrant plugin install vagrant-reload```
Now, in order to bring up our environment, run: 
```vagrant up --provider vbox```
The very first time you run this command it will check locally to see if you already have the base box downloaded. Assuming you dont, that's fine! Vagrant will go out and download it from their public repository for you! It's a full Windows Server Core install, so it is a couple gig. Do not fear for your own harddrive though! Vagrant utilizes a concept of cloned machines (VirtualBox) or differencing disks (Hyper-V). Essentially, it takes the harddrive, and lays another disk on top of it that will be used for any changes to any file that already exists on the disk along with any other data you add to it. For me, this takes about 10 minutes for each of the boxes. Once they are downloaded the first time, they won't need to be downloaded again. 
Once it has the box downloaded for the first vm ('dc'), it will start running the defined Chef recipes. For the first box, that includes setting up: AD, DHCP, DNS, and a Certificate Store. Once the first box is completed, so long as there are no errors (warnings are ok), it will move on to the next vm ('admin'). This box uses a different image (Windows Server with Desktop) so it will need to download this one. Then it moves on to the Chef phase and so on through the other two boxes.
I've found that if I already have the base boxes downloaded, if I run `vagrant up` when none of the vms are built, it takes about 30 minutes to build. For what you get, that doesn't seem terrible!

## What about when I don't need it?
Good question! When you don't need it anymore you have a couple options:
* `vagrant halt`
  * This will just stop and shutdown all of the boxes
* `vagrant destroy`
  * This will stop and delete all of the boxes. Alternatively, you can specify a box to destroy.
    * Keep in mind! When you destroy a box, the AD object for the computer is not cleaned up and will need to be manually removed.
* `vagrant provision`
  * If something that Chef configures is out of place, you can run `vagrant provision <boxname>` and it will re-run all of the provisioning steps defined in the Vagrant file against that box. It will not fix everything, but may bring you back to a working point.

If you are completely done with everything, after you run `vagrant destroy`, you can run `vagrant box list` and then `vagrant box prune <box>` to delete the base images.

If you need it again, just run `vagrant up` and if the boxes are still downloaded, you should have a full environment in about 50ish minutes!