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
if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=$nafabox_path
source $dirinstall/proctype.sh

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

version=`lsb_release -c -s`

#sudo usermod -l nafa -d /home/nafa -m tinker

######
# Options d'installation
######

# init

installMate="FALSE"
language="FALSE"
autologin="FALSE"
ip_indicator="FALSE"
host="FALSE"

if [[ $DESKTOP_SESSION == "mate" ]]
then
	if chose=`yad --width=350 \
		--center \
		--form \
		--title="Select Installation Options :" \
		--text="Install Program :" \
		--field=":LBL" \
		--field="Plugin IP Indicator:CHK" \
		--field="Fr language:CHK" \
		--field="Autologin for dev armbian (nightly):CHK" \
		--field="Change hostname to NAFABox ?:CHK" \
		"" "TRUE" "FALSE" "FALSE" "TRUE"`
	then
		# recuperation des valeurs
		ip_indicator=$(echo "$chose" | cut -d "|" -f2)
		language=$(echo "$chose" | cut -d "|" -f3)
		autologin=$(echo "$chose" | cut -d "|" -f4)
		host=$(echo "$chose" | cut -d "|" -f5)

	else
		echo "cancel"
	fi
else
	if chose=`yad --width=300 \
		--center \
		--form \
		--title="Select Installation Options :" \
		--text="Install Program :" \
		--field=":LBL" \
		--field="Mate destktop and components:CHK" \
		--field="Fr language:CHK" \
		--field="Plugin IP Indicator:CHK" \
		--field="Autologin for dev armbian (nightly):CHK" \
		--field="Change hostname to NAFABox ?:CHK" \
		"" "TRUE" "FALSE" "TRUE" "FALSE" "TRUE"`
	then
		# recuperation des valeurs
		installMate=$(echo "$chose" | cut -d "|" -f2)
		language=$(echo "$chose" | cut -d "|" -f3)
		ip_indicator=$(echo "$chose" | cut -d "|" -f4)
		autologin=$(echo "$chose" | cut -d "|" -f5)
		host=$(echo "$chose" | cut -d "|" -f6)

	else
		echo "cancel"
	fi
fi

if [[ $host == "TRUE" ]]
then


	$dirinstall/install_hostname.sh

fi

# Options de apt-get pour l'installation des paquets
options="-y"
#activation de l'autologin pour les version nightly
if [[ $autologin == "TRUE" ]]
then
	figlet -k Install AutoLogin
	echo "================================================="
	echo "================================================="

	if [ -f "/usr/share/lightdm/lightdm.conf.d/60-lightdm-gtk-greeter.conf" ]
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
#  Désinstallation de xfce et installation de Mate
if [[ $installMate == "TRUE" ]]
then

	figlet -k Install Ubuntu Mate
	echo "================================================="
	echo "================================================="

	# add repository pour avoir la 1.16 au lieu de la 1.12
	if [[ $version == "xenial" ]]
	then
		sudo apt-add-repository -y ppa:ubuntu-mate-dev/xenial-mate # ==> bug
	fi
	sudo apt-get update
	# désinstallation xfce4
	sudo apt-get -y remove --purge  xfce*
	sudo apt-get -y remove --purge  lxde
	sudo apt-get -y remove --purge  lubuntu*
	sudo apt autoremove -y
	sudo apt-get -y clean
	sudo apt-get update
	# installation du session manager
    echo "#################################"
    echo "Chose NoDM after install"
    echo "#################################"
	sudo apt-get -y install lightdm
	sudo apt-get -y install xserver-xorg
	sudo apt-get -y install lightdm-greeter
	# Mise à jour de l'autologin
	cat  $dirinstall/20-lightdm.conf | sed -e "s/MOI/$(whoami)/g" > /tmp/20-lightdm.conf
	sudo cp /tmp/20-lightdm.conf /etc/lighdm/lightdm.conf.d/.

    

    machine=$(sudo lshw | grep "produit\|product" | grep "Raspberry")
	if [[ $version == "bionic" ]]
	then
        if [[ $proc == "_armhf" ]]
	        then
		        if [[ $machine != *"Raspberry"* ]]
		        then
				# remove special package for bionic armbian tinkerboard
				    echo "purge next-tinkerboard package"
                    sudo dpkg --purge chromium-browser
			        sudo dpkg --purge linux-bionic-root-next-tinkerboard
                fi
            fi
        fi

	# installation de base de mate
	sudo apt-get $options install mate
    sudo apt-get $options install ubuntu-mate-core ubuntu-mate-desktop
    sudo apt-get $options install ubuntu-mate-default-settings ubuntu-mate-icon-themes
    sudo apt-get $options install ubuntu-mate-live-settings ubuntu-mate-guide

	# installation de mate compléments
	sudo apt-get $options install mate-desktop-environment-extras mate-indicator-applet
	sudo apt-get $options install mate-dock-applet plank mate-hud mate-applet-brisk-menu mate-menu mate-applet-appmenu

    # dangereux à remplacer des que possible
	sudo apt-get $options install mate-*
	sudo apt-get $options install indicator-*
	
	# supprimer veille
	sudo sed -i "/DPMS/ s/true/false/" /etc/X11/xorg.conf.d/01-armbian-defaults.conf
	# Ajout d'utilitaires
	echo "================================================="
	echo "================================================="
	echo "install supplements"
	echo "================================================="
	echo "================================================="

	sudo apt-get $options install synaptic
	sudo apt-get $options install engrapa
	sudo apt-get $options install caja-actions
	sudo apt-get $options install caja-wallpaper
	sudo apt-get $options install caja-open-terminal
	sudo apt-get $options install mozo
	sudo apt-get $options install pluma
	sudo apt-get $options install mate-tweak
	sudo apt-get $options install mate-themes
	sudo apt-get $options install mate-applets gnome-media
	sudo apt-get $options install mate-panel
	sudo apt-get $options install mate-system-monitor
	sudo apt-get $options install blueman
	sudo apt-get $options install firefox
	sudo apt-get $options install ubuntu-mate-themes
    sudo apt-get $options install pulseaudio indicator-sound indicator-sound-gtk2 libcanberra-pulse paprefs 
    sudo apt-get $options install pulseaudio-module-bluetooth pulseaudio-module-gconf pulseaudio-module-zeroconf
    sudo alsa force-reload
	# désinstallation diverses des relicats de xfce et de thunderbird ajouté par maté
	sudo apt-get -y purge thunderbird transmission-gtk thunar leafpad hexchat geany k3b brasero cheese
	sudo apt-get -y remove --purge  libreoffice-*
    sudo apt-get -y install chromium-browser
    
    sudo apt-get $options purge indicator-printers indicator-china-weather indicator-network-tools indicator-network-autopilot

    sudo dpkg --configure -a
    sudo apt-get install -f
    sudo apt-get -y autoremove
    sudo apt-get clean

    if [ -z "$DESKTOP_SESSION" ]
    then
	    echo "export DESKTOP_SESSION=\"mate\""  >> ~/.bashrc
    fi


	# mise à jour de tout le système
	# sudo apt-get -q --yes dist-upgrade
	
fi
# install ip indicator
if [[ $ip_indicator == "TRUE" ]]
then
	$dirinstall/install_ip_indicator.sh
fi

# Installation du fond d'écran
echo "================================================="
echo "================================================="
echo "install Background"
echo "================================================="
echo "================================================="
# set NAFABox wallpaper
mkdir -p ~/bin
backpic="PIA16008-1920x1200.jpg"
dest="$HOME/bin"
cp $dirinstall/$backpic $dest/$backpic

if [[ $installMate == "TRUE" ]]
then
    gsettings set org.mate.background picture-filename $dest/$backpic
elif [[ $DESKTOP_SESSION == "mate" ]]
then
    gsettings set org.mate.background picture-filename $dest/$backpic
elif [[ $DESKTOP_SESSION == "lxde" ]]
then
    pcmanfm --set-wallpaper="$dest/$backpic"
elif [[ $DESKTOP_SESSION == "xfce" ]]
then
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-show -s true
    xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/image-path --set $dest/$backpic
fi


if [[ $language == "TRUE" ]]
then

	figlet -k Install Language
	echo "================================================="
	echo "================================================="
	# passer le systeme en français
	# ajout des packs langage
	sudo apt-get $options install language-pack-kde-fr
	sudo apt-get $options install language-pack-fr language-pack-gnome-fr
	sudo apt-get $options install firefox-locale.fr
	sudo locale-gen fr_FR fr_FR.UTF-8
	sudo update-locale LC_ALL=fr_FR.UTF-8 LANG=fr_FR.UTF-8
	sudo dpkg-reconfigure keyboard-configuration
fi
	


