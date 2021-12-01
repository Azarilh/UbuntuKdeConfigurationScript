#!/bin/bash

echo "Editing '/etc/environment'..."
echo '
# Enable ibus.
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus

# 

# Set language and locale
#export LANG="en_GB.UTF-8"
export LC_ALL="en_IE.UTF-8"
#export LC_TIME="en_IE.UTF-8"
#export LC_NUMERIC="en_IE.UTF-8"
#export LC_CTYPE="en_IE.UTF-8"
#export LC_COLLOCATE="en_IE.UTF-8"
#export LC_MONETARY="en_IE.UTF-8"
export LC_MESSAGES="en_IE.UTF-8"
#export LC_PAPER="en_IE.UTF-8"
#export LC_NAME="en_IE.UTF-8"
#export LC_ADDRESS="en_IE.UTF-8"
#export LC_TELEPHONE="en_IE.UTF-8"
#export LC_MEASUREMENT="en_IE.UTF-8"
#export LC_INDENTIFICATION="en_IE.UTF-8"

# KDE file chooser for GTK apps
export GTK_USE_PORTAL=1' >> /etc/environment

# Edit .bashrc
echo "#alias in="sudo pacman -S --needed"             #install packages
#alias rin="sudo pacman -S"                     #reinstall packages
#alias up="sudo pacman -Sy"                     #update repositories
#alias Syu="sudo pacman -Syu"                   #upgrade all
#alias upg="sudo pacman -U"                     #upgrade packages
#alias re="sudo pacman -R"                      #remove packages

alias in="sudo apt install"                     #install packages
alias rin="sudo apt install --reinstall"        #reinstall packages
alias up="sudo apt update && sudo apt list --upgradable"                        #>
alias upg="sudo apt upgrade"                    #upgrade packages/upgrade all
alias re="sudo apt remove"                      #remove packages
alias pu="sudo apt purge"                       #purge packages
alias ar="sudo apt autoremove"                  #remove outdated packages
alias upgrade-kubuntu="sudo do-release-upgrade -m desktop -f DistUpgradeViewKDE"
alias drivetestwrite="sudo /sbin/sysctl -w vm.drop_caches=3 && sync; dd if=/dev/z>
alias drivetestread="sudo /sbin/sysctl -w vm.drop_caches=3 && dd if=tempfile of=/>
alias owo="neofetch"

export SUDO_ASKPASS=/home/azarilh/Programs/Scripts/Variables/askpass.sh
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export DISPLAY=:0.0
QT4_IM_MODULE=fcitx" > /home/azarilh/.bashrc

journalctl --vacuum-size=200M

# echo "Correcting some colors for the app Tagaini Jisho for dark themes..."
# echo ".mainwriting a {
# 	color: #fff;
# 	text-decoration: none;
# }" > /usr/share/tagainijisho/detailed_kanjidic2.css
# echo "table {
# 	margin: 0px;
# 	padding: 0px;
# }
# 
# tr {
# 	margin: 0px;
# 	padding: 0px;
# }
# 
# td {
# 	margin: 0px;
# 	padding: 0px;
# }
# 
# .subinfo {
# 	background-color: #d00;
# 	width: 100%;
# }
# 
# .subinfo .title {
# 	background-color: #101114;
# 	font-weight: bold;
# }
# 
# .subinfo .contents {
# 	background-color: #101114;
# }
# 
# .notes {
# 	width: 100%;
# 	padding: 5px;
# 	background-color: #ffff88;
# }" > /usr/share/tagainijisho/detailed_default.css


# echo "Editing '/etc/systemd/system.conf'..."
# echo "
# DefaultTimeoutStartSec=10s
# DefaultTimeoutStopSec=10s" >> /etc/systemd/system.conf
