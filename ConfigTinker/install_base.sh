################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#!/bin/bash
######
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$(find ~ -name ConfigTinker)
######
sudo rm /var/lib/dpkg/lock
sudo apt-get -y install libnss3
sudo apt-get -y install software-properties-common
sudo update
sudo apt-get -y install dialog
sudo apt-get -y install dirmngr
sudo apt-get -y install git
######
# Options d'installation
######
DIALOG=${DIALOG=dialog}
fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
trap "rm -f $fichtemp" 0 1 2 5 15
$DIALOG --backtitle "Option" \
	--title "Options" --clear \
    --checklist "Select Option" 20 61 8 \
        0 "Mate destktop and components" off\
		1 "Fr language" off 2> $fichtemp
valret=$?
language=0
installMate=0
for n in $(cat $fichtemp)
do
	case $n in
	0)
		installMate=1
		;;
	1)
		language=1
		;;
	esac
done
	
# Options de apt-get pour l'installation des paquets
options="-y"
#  Désinstallation de xfce et installation de Mate
if [[ $installMate == 1 ]]
then
	# add repository pour avoir la 1.16 au lieu de la 1.12
	sudo apt-add-repository -y ppa:ubuntu-mate-dev/xenial-mate 
	# désinstallation xfce4
	sudo apt-get -y remove --purge  xfce*
	sudo apt-get -y remove --purge  lxde*
	sudo apt autoremove -y
	sudo apt-get -y clean
	# installation de base de maté
	sudo apt-get update
	sudo apt-get $options install mate
	# installation de maté compléments
	sudo apt-get $options install mate-desktop-environment-extras
	# supprimer veille
	sudo sed -i "/DPMS/ s/true/false/" /etc/X11/xorg.conf.d/01-armbian-defaults.conf
	# Ajout d'utilitaires
	sudo apt-get $options install synaptic
	sudo apt-get $options install engrapa
	sudo apt-get $options install caja-actions
	sudo apt-get $options install caja-wallpaper
	sudo apt-get $options install caja-open-terminal
	sudo apt-get $options install mozo
	sudo apt-get $options install pluma
	sudo apt-get $options install mate-tweak
	sudo apt-get $options install mate-themes
	sudo apt-get $options install mate-applets
	sudo apt-get $options install mate-panel
	sudo apt-get $options install mate-system-monitor
	# désinstallation diverses des relicats de xfce et de thunderbird ajouté par maté
	sudo apt-get -y purge blueman thunderbird transmission-gtk thunar firefox-locale.en
	sudo apt-get -y remove --purge  libreoffice*
	# mise à jour de tout le système
	sudo apt-get -q --yes dist-upgrade
	# Installation du fond d'écran
	backpic="PIA16008-1920x1200.jpg"
	dest="/usr/share/backgrounds/mate/desktop"
	sudo cp $dirinstall/$backpic $dest/.
	gsettings set org.mate.background picture-filename $dest/$backpic
fi
if [[ $language == 1 ]]
then
	# passer le systeme en français
	# ajout des packs langage
	sudo apt-get $options language-pack-kde-fr
	sudo apt-get $options install language-pack-fr language-pack-gnome-fr
	#sudo apt-get $options install firefox-locale.fr
	sudo locale-gen fr_FR fr_FR.UTF-8
	sudo update-locale LC_ALL=fr_FR.UTF-8 LANG=fr_FR.UTF-8
	sudo dpkg-reconfigure keyboard-configuration
fi
	

