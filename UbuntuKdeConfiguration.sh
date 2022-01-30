#!/bin/bash
 
clear
echo -e "setf 8\nsetb 4" | tput -S
echo -n "UbuntuKdeConfiguration.sh — v1.1.0"
echo -e "setf 8\nsetb 0" | tput -S && echo

echo

echo "This script is supposed to be located under '/UbuntuKdeConfiguration' (into root).
It also needs to be executed as root.
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
echo "This script will install packages written in the './Resources/extra' file. Toilet and Vim will also be installed, ye can remove them afterwards.
GPG keys and some repositories will be added. You can chage them from their folders './sources.list.d' and './trusted.gpg.d'.
The secondary script './Resources/extra2.sh' will be executed at last. You can edit it afore it will be executed.
 
Press ENTER to continue."
read continue
 
clear
echo "Initialisation..."
echo
apt install toilet
echo
apt install vim
echo
apt install libnotify-bin
echo
echo "Disabling installation of unnecessary documentations..."
echo "path-exclude /usr/share/doc/*
# we need to keep copyright files for legal reasons
path-include /usr/share/doc/*/copyright
# if you also want to remove the man pages uncomment the next line
#path-exclude /usr/share/man/*
path-exclude /usr/share/groff/*
path-exclude /usr/share/info/*
# lintian stuff is small, but really unnecessary
path-exclude /usr/share/lintian/*
path-exclude /usr/share/linda/*" > /etc/dpkg/dpkg.cfg.d/01_nodoc
 
#echo -e "setf 8\nsetb 3" | tput -S
#echo -n "1/5 — Setting up bootctl..."
#echo -e "setf 8\nsetb 0" | tput -S && echo
#bootctl install
#cd /
#mkdir boot/loader
#cd boot/loader
#echo "default $distro
#timeout " > loader.conf
#echo
#echo "'loader.conf' will now be opened with Vim.
#After 'timeout' write the timeout ye desire in seconds. For example 'timeout 4'.
#This is how long you want to wait until bootctl selects automatically the boot option.
#Press ENTER to open Vim."
#read continue
#vim loader.conf
#mkdir entries
#cd entries
#echo "title $distro
#linux /vmlinuz-linux
#initrd /initramfs-linux.img
#options root=PARTUUID=ASD rw
 
# Press ALT+SHIFT+: and write 'r !blkid' then press ENTER.
# Substitute 'ASD' with the root's PARTUUID." >> $distro.conf
#echo
#echo "'$distro.conf' will now be opened with Vim.
#Substitute 'ASD' with the correct PARTUUID of your root partition.
#To find it out, on vim press ALT+SHIFT+: and write 'r !blkid' then press ENTER.
#Press ENTER to open Vim."
#read continue
#vim $distro.conf
#cd /
#cd UbuntuKdeConfigurationScript
#echo "Systemd-boot: ready."
#echo
#echo "Press ENTER to continue to the next phase."
#read continue


echo -e "setf 8\nsetb 3" | tput -S
echo -n "1/3 - Upgrading repositories..."
echo -e "setf 8\nsetb 0" | tput -S && echo
echo "Copying GPG keys..."
echo -e "setf 7\nsetb 0" | tput -S && echo
cp -r trusted.gpg.d /etc/apt/
echo -e "setf 8\nsetb 0" | tput -S 
echo  "Copying repositories..." 
echo -e "setf 7\nsetb 0" | tput -S && echo
cp -r sources.list.d /etc/apt/
echo -e "setf 8\nsetb 0" | tput -S
echo ___
echo -e "setf 4\nsetb 0" | tput -S && echo
echo "Press ENTER to continue to the next phase."
echo -e "setf 8\nsetb 0" | tput -S && echo
read continue
echo && echo && echo

echo -e "setf 8\nsetb 3" | tput -S
echo -n "2/3 — Installing packages..."
echo -e "setf 7\nsetb 0" | tput -S && echo 
apt update
echo -e "setf 8\nsetb 0" | tput -S
echo "About to install these packages:"
echo -e "setf 7\nsetb 0" | tput -S && echo
cat Resources/extra && echo ___
echo -e "setf 8\nsetb 0" | tput -S && echo
echo "Press ENTER to install them."
read continue
echo -e "setf 7\nsetb 0" | tput -S && echo
apt install $(cat Resources/extra)
echo ___
echo -e "setf 4\nsetb 0" | tput -S && echo
echo "Press ENTER to continue to the next phase."
echo -e "setf 8\nsetb 0" | tput -S && echo
read continue
echo && echo && echo

echo -e "setf 8\nsetb 3" | tput -S
echo -n "3/3 — Executing secondary script..."
echo -e "setf 8\nsetb 0" | tput -S && echo
chmod 777 Resources/extra2.sh
echo "'Resources/extra2.sh' will be now opened with Vim.
Add your own script, if you want. It will be executed immediately after you close Vim.
Press ENTER to open Vim."
read continue
vim Resources/extra2.sh
echo -e "setf 7\nsetb 0" | tput -S
sh Resources/extra2.sh
echo -e "setf 8\nsetb 0" | tput -S && echo
echo ___
echo "Secondary script executed."
echo -e "setf 4\nsetb 0" | tput -S && echo
echo -n "Press ENTER to continue."
echo -e "setf 8\nsetb 0" | tput -S && echo
read continue
echo && echo && echo

echo -e "setf 8\nsetb 1" | tput -S
echo -n FINISHED
echo -e "setf 7\nsetb 0" | tput -S && echo
# notify-send --expire-time=3000 UbuntuKdeConfiguration.sh "Settin' up your distro has been done."
rm *.tmp
sleep 2
echo
echo "Heyyyyy,"
echo "thank you for using this script."
sleep 2
echo "Contact me on the GitHub page for feedback."
echo "github.com/Azarilh/UbuntuKdeConfigurationScript"
sleep 2
echo "Have a nice day!"
sleep 2
echo

echo -e "setf 4\nsetb 0" | tput -S
echo "Press ENTER to exit."
echo -e "setf 8\nsetb 0" | tput -S && echo
read continue
exit
