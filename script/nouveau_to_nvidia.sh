#!/bin/bash
# nouveau -> nvidia

/usr/bin/sudo /bin/sed  -i 's/options nouveau modeset=1/#options nouveau modeset=1/' /etc/modprobe.d/modprobe.conf
/usr/bin/sudo /bin/sed -i 's/MODULES="nouveau"/#MODULES="nouveau"/' /etc/mkinitcpio.conf

/usr/bin/sudo /usr/bin/pacman -Rdds --noconfirm mesa xf86-video-nouveau
/usr/bin/sudo /usr/bin/pacman -S --noconfirm nvidia-dkms

/usr/bin/sudo /sbin/mkinitcpio -p linux

/usr/bin/sudo /sbin/mkinitcpio -p linux-lts
