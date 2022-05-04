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

## bahmni-specific documentation

TODO(cdmedrano): Update instructions on installing bahmni on clean centos7.
