# UbuntuKdeConfigurationScript
<hr>
This script auto configures Ubuntu with KDE.<br>
It's made for personal use, but if someone want to use it, they're free to do so.<br><br>
This script will install packages written in the './Resources/extra' file. Vim will also be installed, ye can remove it afterwards.<br>
~~Systemd-boot will substitute Grub as boot manager.~~ (Not anymore since version 1.1.0, but the 1.0.1 should do that, see the first note below tho'.)<br>
GPG keys and some repositories will be added. You can chage 'em from their folders './sources.list.d' and './trusted.gpg.d'.<br>
The secondary script './Resources/extra2.sh' will be executed at last. You can edit it afore it will be executed.<br><br>

NOTE: The 1.0.1 version of the script configures Systemd-boot but there _might_ be an issue! Let's just say that the script doesn't fully configure systemd-boot, unfortunately. After you used this script, if you delete Grub you may not be able to boot up any OS.<br>
The 1.0.1 version is deprecated tho', as i personally don't care using systemd-boot on Ubuntu anymore. Maybe in the future i will write a script only for that, so check my GitHub page if you're interested.<br>

NOTE: The 1.0.1 version was tested on a VM and on an actual PC, but the 1.1.0 is still waitin' to be tested, beware! >:)
