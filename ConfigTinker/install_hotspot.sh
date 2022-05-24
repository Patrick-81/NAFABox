#!/bin/bash -i
######
# Recherche du répertoire ConfigTinker
######
if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=${nafabox_path}
echo $dirinstall

figlet -k Install HotSpot
echo "================================================="
echo "================================================="

######
# pre-requis
######
installed=$(apt -qq list uuid)
testinstall=$([[ $(grep "install" <<< $installed) ]] && echo true || echo false)

######
# Clone the github ap-hotspot
######
sudo apt -y update
sudo apt -y install libnotify-bin iw dnsmasq hostapd
github="https://github.com/thecooltool/AP-Hotspot"
if [ -z $(which git) ]
then
    sudo apt -y install git
fi
cd /tmp
git clone $github
cd ./AP-Hotspot
sudo make install PREFIX=/usr/bin
sudo ap-hotspot configure
sudo ap-hotspot stop
sudo ap-hotspot enable
sudo ap-hotspot start




