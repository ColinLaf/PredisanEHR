Predisan-specific Documentation
================================================================================

## installing

The EMR system is a Hyper-V virtual machine that can run on Windows Server
2012R2 with some small changes to the vm config to fit the local environment. To
make it easier to download, the images are compressed and split into 1 GiB
peaces using 7-zip.

### Instructions

1. Download and install 7-Zip from (https://www.7-zip.org/).
2. Download both parts from
   (https://carlos1001.com/predisanehr/predisanehr-prod-0.93/).
3. Place both parts in the same directory.
4. Open 7-zip, and find the directory with the two parts.
5. Right click on part 1, expand 7-zip, and then click on extract to
   predisanehr-prod-0.93.
6. Now in Hyper-V Manager, go to import vm, and use the extracted directory as
   the path to search for vm's.
7. Finish importing the vm based on the current Hyper-V server configuration.

## After Importing

After importing the vm, go into the vm settings by right clicking the name of
the vm in Hyper-V Manager and:

- change the network switch to match the local configuration.
- Verify the MAC address is set to fixed.

Also, even though the vm has 2 processor cores, if the host can support it, it
is advisable to increase the number of CPU cores from 2 to 4.

After changing the vm settings, you can start the vm. The vm is configured
to acquire an IP address from a DHCP server, and for all services to start after
boot. SSH is also enabled. The default username is `predisanehr-admin`, and the
password is `predisanehr-admin-csc4620`

Once the VM boots, figure out the IP address. You can do this through the
DHCP server control panel, and change the default password for SSH:

1. From a Windows 10 machine, `ssh predisanehr-admin@<ip_address_here>` in a
   command prompt.
2. When prompted for the password, the password is `predisanehr-admin-csc4620`
3. Enter `passwd`.
4. When prompted, enter the current password and a new password followed by
   confirming it. It's Recommended to pick a strong password because anybody can
   access all data if the password is ever compromised.
6. Type `exit` to log out of the server.

Bahmni-specific Documentation
================================================================================

At the time of this writing, bahmni, only works on CentOS7. Minor versions above
CentosOS 7.6 should be fine, but you have to be careful to not update some
packages, or the entire stack will break in strange and unexplainable ways.
Despite the official documentation from Bahmni allowing people to upgrade an
existing install, it's cleaner and easier to start from a fresh install of the
operating system. As always, Proceed with caution when doing any of these
operations on a live install. These instructions will likely vary across Bahmni
versions; they only serve as guidelines, not a procedure that will always work.
To ensure data Integrity, consider cloning or snapshotting the virtual machine.
Alternatively, consider creating a new virtual machine for testing a newer version of the
software to avoid losing the data.

## Bahmni Installation from Scratch

1. Download CentOS 7 minimal from one of the mirrors listed at
   (http://isoredirect.centos.org/centos/7/isos/x86_64/).
2. Attach the ISO image to an empty VM, and follow the on-screen instructions
   after booting from the ISO image, including selecting timezone, creatin
   users, network configuration, and disk configuration. The default settings
   should be fine for most options.
3. After the install finishes, the machine should reboot, and present you with a
   login screen. Sign in with the configured username and password.
4. After signing in, enter `sudo yum update`.

Bahmni doesn't like SELinux, so we have to disable it. I don't like turning it
completely off, so I picked the second best option to set it to permissive.

`suvo vi /etc/sysconfig/selinux`

Change the line `SELINUX=enforcing` to `SELINUX=permissive`.

Enter `reboot` once done.
5. At this point, you're ready to follow the instructions located at
   (https://bahmni.atlassian.net/wiki/spaces/BAH/pages/33128505/Install+Bahmni+on+CentOS).
   Come back to this document after you run the `bahmni install` command.

At this point, Bahmni should be installed on that virtual machine. However, we
need to disable some packages from upgrading.

`sudo vi /etc/yum.conf`

Under `[main]` somewhere, add the line `exclude=mysql* bahmni* ansible`
