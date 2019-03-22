#!/bin/bash
 
clear
echo "UbuntuKdeConfiguration.sh — Version 1.01"
sleep 1
 
clear
echo "This script is supposed to be located under '/UbuntuKdeConfiguration' (into root).
It also needs to be executed as root
IMPORTANT: Using this script is YOUR full responsability!
I don't assume any responsability in regards of the usage of my script.
Using it, you agree that it's your full responsability whatever will happen to your computer device.
If you don't want to risk try it first on a virtual machine or an unused/unimportant computer or open the script with a text editor and check if it's what you want.
You can edit it and share it edited or not edited. The copyright is GNU General Public Licence v3."
sleep 2
echo
echo "PRESSING ENTER YOU AGREE THAT IT'S YOUR FULL RESPONSABILITY!"
sleep 2
echo "Press ENTER to continue."
read continue
clear
echo "This script will install packages written in the './Resources/extra' file. Toilet and Vim will also be installed, ye can remove 'em afterwards.
Systemd-boot will substitute Grub as boot manager.
GPG keys and some repositories will be added. You can chage 'em from their folders './sources.list.d' and './trusted.gpg.d'.
The secondary script './Resources/extra2.sh' will be executed at last. You can edit it afore it will be executed.
 
Press ENTER to continue."
read continue
 
clear
echo "Initialisation..."
echo
apt install toilet
echo "Toilet ready."
echo
apt install vim
echo "Vim ready."
echo
apt install libnotify-bin
echo "Libnotify-bin ready."
echo
echo "Vim will be now opened. Write your distribuition's name without spaces and special characters.
Press ENTER to open Vim."
read continue
vim distro.tmp
distro=$(cat distro.tmp)
sleep 1
clear
 
clear
toilet "1/5 — Setting up bootctl..." -f term --gay
bootctl install
cd /
mkdir boot/loader
cd boot/loader
echo "default $distro
timeout " > loader.conf
echo
echo "'loader.conf' will now be opened with Vim.
After 'timeout' write the timeout ye desire in seconds. For example 'timeout 4'.
This is how long you want to wait until bootctl selects automatically the boot option.
Press ENTER to open Vim."
read continue
vim loader.conf
mkdir entries
cd entries
echo "title $distro
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=PARTUUID=ASD rw
 
# Press ALT+SHIFT+: and write 'r !blkid' then press ENTER.
# Substitute 'ASD' with the root's PARTUUID." >> $distro.conf
echo
echo "'$distro.conf' will now be opened with Vim.
Substitute 'ASD' with the correct PARTUUID of your root partition.
To find it out, on vim press ALT+SHIFT+: and write 'r !blkid' then press ENTER.
Press ENTER to open Vim."
read continue
vim $distro.conf
cd /
cd UbuntuKdeConfigurationScript
echo "Systemd-boot: ready."
echo
echo "Press ENTER to continue to the next phase."
read continue
clear

toilet "2/5 — Adding GPG keys..." -f term --gay
cp -r trusted.gpg.d /etc/apt/
echo "GPG keys added."
echo
echo "Press ENTER to continue to the next phase."
read continue
clear
 
toilet "3/5 — Adding repositories..." -f term --gay
cp -r sources.list.d /etc/apt/
echo "Repositories added."
echo
echo "Press ENTER to continue to the next phase."
read continue
clear
 
toilet "4/5 — Installing packages..." -f term --gay
apt update
echo "Repositories loaded."
extra=$(cat Resources/extra)
apt install $extra
echo "Packages installed."
echo
echo "Press ENTER to continue to the next phase."
read continue
clear
 
toilet "5/5 — Executing secondary script..." -f term --gay
chmod 777 Resources/extra2.sh
echo "'Resources/extra2.sh' will be now opened with Vim.
Add your own script, if ye want. It will be executed immediately after you close Vim.
Press ENTER to open Vim."
read continue
vim Resources/extra2.sh
sh Resources/extra2.sh
echo "Secondary script executed."
 
clear
toilet DONE! --gay
notify-send --expire-time=3000 UbuntuKdeConfiguration.sh "Settin' up $distro has been done."
echo "
Remember to uninstall Grub after you checked that Systemd-boot works with this command:
'apt purge grub*'."
rm *.tmp
sleep 2
echo
echo "Hey,"
echo "thank you for using this script."
sleep 2
echo "Contact me on the GitHub page for feedback."
echo "github.com/Azarilh/ArchLinuxKdeInstallScript"
sleep 2
echo "Have a nice day!"
sleep 2
echo
echo "Press ENTER to exit."
read
exit
