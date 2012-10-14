#!/bin/sh
# Part of raspi-config http://github.com/super-nathan/raspi-config
#
# See LICENSE file for copyright and license details

# Should be installed to /etc/profile.d/raspi-config.sh to force raspi-config 
# to run at initial login

# You may also want to set automatic login in /etc/inittab on tty1 by adding a 
# line such as:
# 1:2345:respawn:/bin/login -f root tty1 </dev/tty1 >/dev/tty1 2>&1 # RPICFG_TO_DISABLE

# If you are trying to make this run on boot for a machine that has already been configured,
# then if you follow all the above instructions you will still be booted into an X session.
# If you <ctlr>+<alt>+<f1> you will find the raspi-config there ready to run. 
# In order to boot straight into Raspi-config you must disable lightdm with 
# $ sudo update-rc.d lightdm disable
# Then when you reboot the machine, you will be sent straight into the config.


if [ $(id -u) -ne 0 ]; then
  printf "\nNOTICE: the software on this Raspberry Pi has not been fully configured. Please run 'sudo raspi-config'\n\n"
else
  raspi-config
  exec login -f pi
fi
