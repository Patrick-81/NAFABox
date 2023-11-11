################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
#			Sébastien Durand
# On June 10 2017
# V0.1
################################################
#!/bin/bash -i
######
######
# Recherche du répertoire ConfigTinker
######
if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=${nafabox_path}
source ${dirinstall}/proctype.sh

server_choice=$2

######
sudo rm /var/lib/dpkg/lock
sudo apt-get -y install libnss3
sudo apt-get -y install software-properties-common
sudo apt-get update 
sudo apt-get -y install dirmngr
sudo apt-get -y install git
sudo apt-get -y install gparted
# for bluetooth
sudo apt-get -y install bluetooth bluez bluez-tools pulseaudio-module-bluetooth blueman
# for hotspot
# sudo apt-get -y install hostapd
sudo apt-get -y install dhcpcd5 dhcpcd-gtk

#sudo apt-get --reinstall -o Dpkg::Options::="--force-confnew" -y --no-install-recommends install hostapd
#sudo apt-get --reinstall -o Dpkg::Options::="--force-confnew" -y --no-install-recommends install hostapd-realtek

version=`lsb_release -c -s`

#sudo usermod -l nafa -d /home/nafa -m tinker

######
# Options d'installation
######

# init

ip_indicator="FALSE"
host="FALSE"

if [[ $1 == "initial" ]]
then
	st=(true true)

else
	st=(false false)
fi

if [[ ${server_choice} == "server" ]]
then
    ip_indicator="FALSE"
    host="TRUE"

elif [[ ${server_choice} == "default" ]]
then
    ip_indicator="TRUE"
    host="TRUE"
else
  if chose=`yad --width=300 \
    --center \
    --form \
    --title="Select Installation Options :" \
    --text="Install Program :" \
    --field=":LBL" \
    --field="Plugin IP Indicator:CHK" \
    --field="Change hostname to NAFABox ?:CHK" \
    "" "${st[0]}" "${st[1]}"`
    then
	# recuperation des valeurs
	ip_indicator=$(echo "$chose" | cut -d "|" -f2)
	host=$(echo "$chose" | cut -d "|" -f3)

    else
	echo "cancel"
    fi
fi

if [[ ${host} == "TRUE" ]]
then
	${dirinstall}/install_hostname.sh ${server_choice}
fi


# install ip indicator
if [[ ${ip_indicator} == "TRUE" ]]
then
	${dirinstall}/install_ip_indicator.sh
fi

# Installation du fond d'écran
echo "================================================="
echo "================================================="
echo "install Background"
echo "================================================="
echo "================================================="
# set NAFABox wallpaper
mkdir -p ~/bin
backpic="wallpaper.png"
backpic2="logo_256.png"
dest="$HOME/bin"
cp ${dirinstall}/${backpic} ${dest}/${backpic}
cp ${dirinstall}/${backpic2} ${dest}/${backpic2}


if [[ ${DESKTOP_SESSION} == "mate" ]]
then
    gsettings set org.mate.background picture-filename ${dest}/${backpic}
elif [[ ${DESKTOP_SESSION} == "lxde" ]]
then
    pcmanfm --set-wallpaper="$dest/$backpic"
elif [[ ${DESKTOP_SESSION} == "xfce" ]] || [[ ${DESKTOP_SESSION} == "xubuntu" ]]
then
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-show -s true
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/image-path --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor1/image-path --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor2/image-path --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor3/image-path --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/workspace0/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/workspace1/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/workspace2/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/workspace3/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor1/workspace0/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor1/workspace1/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor1/workspace2/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor1/workspace3/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual0/workspace0/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual0/workspace1/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual0/workspace2/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual0/workspace3/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual1/workspace0/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual1/workspace1/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual1/workspace2/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorVirtual1/workspace3/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-1/workspace0/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-1/workspace1/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-1/workspace2/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-1/workspace3/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-0/workspace0/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-0/workspace1/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-0/workspace2/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorHDMI-0/workspace3/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitoreDP-0/workspace0/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitoreDP-0/workspace1/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitoreDP-0/workspace2/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitoreDP-0/workspace3/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitoreDP-1/workspace0/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitoreDP-1/workspace1/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitoreDP-1/workspace2/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitoreDP-1/workspace3/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-0/workspace0/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-0/workspace1/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-0/workspace2/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-0/workspace3/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-1/workspace0/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-1/workspace1/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-1/workspace2/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitorDP-1/workspace3/last-image --set ${dest}/${backpic}
    xfconf-query --channel xfce4-panel --property /plugins/plugin-1/button-icon --set ${dest}/${backpic2}
fi



	


