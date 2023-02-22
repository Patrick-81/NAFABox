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
sudo apt-get -y install chromium-browser
# for bluetooth
sudo apt-get -y install bluetooth bluez bluez-tools pulseaudio-module-bluetooth blueman
# for hotspot
sudo apt-get -y install dnsmasq hostapd
sudo apt-get -y install dhcpcd5 dhcpcd-gtk

#sudo apt-get --reinstall -o Dpkg::Options::="--force-confnew" -y --no-install-recommends install hostapd
#sudo apt-get --reinstall -o Dpkg::Options::="--force-confnew" -y --no-install-recommends install hostapd-realtek

version=`lsb_release -c -s`

#sudo usermod -l nafa -d /home/nafa -m tinker

######
# Options d'installation
######

# init

installMate="FALSE"
autologin="FALSE"
ip_indicator="FALSE"
o_indicator="FALSE"
host="FALSE"

if [[ $1 == "initial" ]]
then
	st=(true true true false true)

else
	st=(false false false false false)
fi

if [[ ${server_choice} == "server" ]]
then
    installMate="FALSE"
    autologin="FALSE"
    ip_indicator="FALSE"
    o_indicator="FALSE"
    host="TRUE"

elif [[ ${server_choice} == "default" ]]
then
    installMate="FALSE"
    autologin="FALSE"
    ip_indicator="TRUE"
    o_indicator="TRUE"
    host="TRUE"
else
    if chose=`yad --width=300 \
	--center \
	--form \
	--title="Select Installation Options :" \
	--text="Install Program :" \
	--field=":LBL" \
	--field="Mate destktop and components:CHK" \
	--field="Plugin IP Indicator:CHK" \
        --field="Other indicator:CHK" \
	--field="Autologin for dev armbian (nightly):CHK" \
	--field="Change hostname to NAFABox ?:CHK" \
	"" "${st[0]}" "${st[1]}" "${st[2]}" "${st[3]}" "${st[4]}"`
    then
	# recuperation des valeurs
	installMate=$(echo "$chose" | cut -d "|" -f2)
	ip_indicator=$(echo "$chose" | cut -d "|" -f3)
        o_indicator=$(echo "$chose" | cut -d "|" -f4)
	autologin=$(echo "$chose" | cut -d "|" -f5)
	host=$(echo "$chose" | cut -d "|" -f6)

    else
	echo "cancel"
    fi
fi

if [[ ${host} == "TRUE" ]]
then
	${dirinstall}/install_hostname.sh ${server_choice}
fi

# Options de apt-get pour l'installation des paquets
options="-y"
#activation de l'autologin pour les version nightly
if [[ ${autologin} == "TRUE" ]]
then
	figlet -k Install AutoLogin
	echo "================================================="
	echo "================================================="

	if [[ -f "/usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf" ]]
	then
		if [grep -q "autologin" "/usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf" ]
		then
			echo "autologin exist"
		else
			echo "autologin activate"
			echo "autologin-user=$USER"| sudo tee -a /usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf
		fi
	fi
fi

if [[ ${o_indicator} == "TRUE" ]]
then
    #sudo apt-get ${options} install indicator-cpufreq
    sudo apt-get ${options} install indicator-multiload
    #sudo apt-get ${options} install indicator-sound indicator-power indicator-messages indicator-application indicator-session
    #sudo apt-get ${options} install indicator-bluetooth
fi

sudo apt-get ${options} purge indicator-china-weather

if [[ ${version} == "xenial" ]]
then
    sudo apt-get ${options} purge indicator-network-tools indicator-network-autopilot
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

if [[ ${installMate} == "TRUE" ]]
then
    gsettings set org.mate.background picture-filename ${dest}/${backpic}
elif [[ ${DESKTOP_SESSION} == "mate" ]]
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



	


