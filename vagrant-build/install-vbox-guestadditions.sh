#!/bin/sh
#
# Run this script on the VM to install VirtualBox guest additions
# to enable features and speed up
#


# First, check if we have VirtualBox Guest Additions already installed:
OUT = `lsmod | grep -io vboxguest`
if [ $? == 0 ]; then
    echo "Guest additions already installed, skipping installation"
    exit 0
fi

# Do the install
cd /tmp
curl -O -c http://download.virtualbox.org/virtualbox/4.3.30/VBoxGuestAdditions_4.3.30.iso
mkdir /mnt/vboxguest
mount VBoxGuestAdditions_4.3.30.iso -i loop /mnt/vboxguest
cd /mnt/vboxguest
sh VBoxLinuxAdditions.run --nox11
cd /mnt
umount /mnt/vboxguest
rmdir /mnt/vboxguest
rm /tmp/VBoxGuestAdditions*.iso

/etc/init.d/vboxadd setup
chkconfig --add vboxadd
chkconfig vboxadd on

