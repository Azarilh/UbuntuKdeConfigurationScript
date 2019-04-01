#!/bin/bash

echo "Editing '/etc/environment'..."
echo '
# Enable ibus.
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

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

echo "Correcting some colors for the app Tagaini Jigho for dark themes..."
echo ".mainwriting a {
	color: #fff;
	text-decoration: none;
}" > /usr/share/tagainijisho/detailed_kanjidic2.css
echo "table {
	margin: 0px;
	padding: 0px;
}

tr {
	margin: 0px;
	padding: 0px;
}

td {
	margin: 0px;
	padding: 0px;
}

.subinfo {
	background-color: #d00;
	width: 100%;
}

.subinfo .title {
	background-color: #101114;
	font-weight: bold;
}

.subinfo .contents {
	background-color: #101114;
}

.notes {
	width: 100%;
	padding: 5px;
	background-color: #ffff88;
}" > /usr/share/tagainijisho/detailed_default.css


echo "Editing '/etc/systemd/system.conf'..."
echo "
DefaultTimeoutStartSec=10s
DefaultTimeoutStopSec=10s" >> /etc/systemd/system.conf
