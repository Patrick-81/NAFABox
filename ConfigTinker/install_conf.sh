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
# Fonction pour l'installation
######
installconf()
{
	if $1
	then
		dial[0]="Installation/Mise à jour des logiciels"
		dial[1]="Installation complémentaire"
		dial[2]="Choisir le(s) logiciel(s) à installer"
	else
		dial[0]="Install/Update of software"
		dial[1]="Additional software(s)"
		dial[2]="Choose software(s) to install"
	fi

	if $1
	then
		choice[0]="Couche de communication web"
		choice[4]="Carte du ciel"
	else
		choice[0]="Web communication layer"
		choice[4]="Skychart"
	fi
	choice[1]="Lin_guider"
	choice[2]="Kstars"
	choice[3]="Phd2"
	choice[5]="Ccdciel"
	choice[6]="Planetary Imager"
	choice[7]="Siril"
	choice[8]="Stellarium"
	choice[9]="install astrometry index(s)"

	DIALOG=${DIALOG=dialog}
	fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
	trap "rm -f $fichtemp" 0 1 2 5 15

	$DIALOG --backtitle "${dial[0]}" \
		--title "${dial[1]}" --clear \
    	--checklist "${dial[2]}" 20 61 9 \
        	0 "${choice[0]}" on\
			1 "${choice[1]}" off\
			2 "${choice[2]}" on\
			3 "${choice[3]}" on\
			4 "${choice[4]}" off\
			5 "${choice[5]}" off\
			6 "${choice[6]}" off\
			7 "${choice[7]}" off \
			8 "${choice[8]}" off\
			9 "${choice[9]}" 2> $fichtemp
	valret=$?
	for n in $(cat $fichtemp)
	do
		case $n in
		0)
			echo "Install web communications"
			$(pwd)/install_comsetup.sh
			echo com >> $(pwd)/install-status.txt
		;;
		1) 
			echo "Install Lin_guider"
			$(pwd)/install_linguider.sh
			;;
		2)
			echo "Install kstars"
			$(pwd)/install_kstars.sh
			;;
		3)
			echo "Install phd2"
			$(pwd)/install_phd2.sh
			;;
		4)
			echo "Installation Skychart"
			$(pwd)/install_skychart.sh
			;;
		5)
			echo "Install ccdciel"
			$(pwd)/install_ccdciel.sh
			;;
		6)
			echo "Install planetary imager"
			$(pwd)/install_planetaryimager.sh
			;;
		7)
			echo "Install siril"
			$(pwd)/install_siril.sh
			;;
		8)
			echo "Install stellarium"
			$(pwd)/install_stellarium.sh
			;;
		9)
			echo "Install index(s)"
			$(pwd)/install_index.sh
			;;
		255)
			echo "escape";;
		esac
	done
}

######
# Statut d'installation
# Installation status
######
touch $(pwd)/install-status.txt
######
# option for apt
######
options="--auto-remove --yes -q"
######
# Install mate
######
if [[ -z $(cat $(pwd)/install-status.txt | grep mate) ]]
then
	$(pwd)/install_base.sh
	echo mate >> $(pwd)/install-status.txt
fi
######
# pré-requis
# pre requisite
######
if [[ -z $(cat install-status.txt | grep prereq) ]]
then
	sudo apt-add-repository -y ppa:mutlaqja/ppa
	sudo apt-add-repository -y ppa:pch/phd2	
	sudo apt update
	sudo apt-get $options install libpangox-1.0-0 libespeak1 libpango1.0-0 \
	libsonic0 espeak-data fonts-freefont-ttf ttf-freefont libjpeg62 libglu1 \
	xplanet espeak qt4-default openssh-server
	echo prereq >> $(pwd)/install-status.txt
fi
######
# Installer les utilitaires
# Install utilities
######
mkdir -p ~/bin
# Modificateur de résolution
# Resolution modifier
$(pwd)/install_setres.sh
######
# Install conf updater
######
cp update_conf.sh ~/bin/.
chmod +x ~/bin/update_conf.sh
sudo ln -sf ~/bin/update_conf.sh /usr/bin/update_conf
sudo cp /usr/share/icons/gnome/32x32/apps/system-software-update.png /usr/share/pixmaps/update_conf.png
# Création de l'icône sur le bureau
$(pwd)/install_shortcut.sh update_conf
######
# Install/Update conf
######
~/bin/update_conf.sh

