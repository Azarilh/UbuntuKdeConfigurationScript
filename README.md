# UbuntuKdeConfigurationScript
<hr>
This script auto configures Ubuntu with KDE.<br>
It's made for personal use, but if someone want to use it, they're free to do so.<br><br>
This script will install packages written in the './Resources/extra' file. Toilet and Vim will also be installed, ye can remove 'em afterwards.<br>
Systemd-boot will substitute Grub as boot manager.<br>
GPG keys and some repositories will be added. You can chage 'em from their folders './sources.list.d' and './trusted.gpg.d'.<br>
The secondary script './Resources/extra2.sh' will be executed at last. You can edit it afore it will be executed.

NOTE: The script is still not ready to configure Systemd-boot! After you used this script, if you delete Grub you will not be able to boot up any OS, probably.
