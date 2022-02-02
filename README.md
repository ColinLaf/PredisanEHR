## predisan-specific documentation

# installing

1. Clone this repo
2. Download cerepa.box from (http://predisanehr-dev.carlos1001.com/cerepa.box).
3. Inside of the PredisanEHR directory, open a command prompt and run **vagrant box add cerepa cerepa.box**
4. In the same command prompt run **vagrant init cerepa**
5. In the same command prompt run **vagrant up**

# updating (with new cerepa.box file)
1. overwrite old cerepa.box file with new one
2. delete old vagrantfile
3. Inside of the PredisanEHR directory, open a command prompt and run **vagrant destroy** type y if it asks for confirmation
4. In the same command prompt run **vagrant box remove cerepa**
5. In the same command prompt run **vagrant box add cerepa cerepa.box**
6. In the same command prompt run **vagrant init cerepa**
7. In the same command prompt run **vagrant up**

## bahmni-specific documentation

# bahmni-vagrant

Management of Vagrant box using Packer.  Out-Of-The-Box bahmni on CentOS 6.8


# Vagrant / Virtual Box Setup for Bahmni

Please follow the steps mentioned in this document on wiki to setup Bahmni Vagrant Box on your machine:
[Bahmni Vagrant Box Setup](https://bahmni.atlassian.net/wiki/display/BAH/Bahmni+Virtual+Box)


# Understanding Packer (For Developers) **Unused for Predisan_EHR** 

Packer is a tool provided by Hashicorp, for creating a Vagrant box out of template VMs. This repository
contains Packer code for creating Bahmni vagrant boxes. For more details on understanding Packer please
read: https://www.packer.io/intro/

In Bahmni's case, we invoke Packer command with reference to file: [template.json](packer/template.json).
It uses a CentOS VM as reference, and then runs appropriate scripts, including installing Bahmni and dev tools, etc.

_Note: Packer runs on Bahmni CI server in pipeline "Release_To_Public" (manually triggered stage). One must trigger this stage after having marked relevant RPMs as "published" on bintray, so that when Packer runs, it picks up the LATEST published RPMs from bintray._
