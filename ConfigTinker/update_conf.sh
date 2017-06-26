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
# Recherche du répertoire contenant les scripts d'installation
######
loc=$(echo $(find ~ -name ConfigTinker) | cut -f 1 -d' ')
cd $loc
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
        	0 "${choice[0]}" off\
			1 "${choice[1]}" off\
			2 "${choice[2]}" off\
			3 "${choice[3]}" off\
			4 "${choice[4]}" off\
			5 "${choice[5]}" off\
			6 "${choice[6]}" off\
			7 "${choice[7]}" off \
			8 "${choice[8]}" off\
			9 "${choice[9]}" off 2> $fichtemp
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
	return
}
######
# Detect language
######
lang=$(locale | grep LANG= | grep fr_FR)
if [[ $lang == *"fr_FR"* ]]
then
	french=true
else
	french=false
fi
######
# Update conf
######
while true
do
	installconf $french
######
# Reboot required
######
	if $french
	then
		dial[0]="Voulez-vous maintenant ?"
		dial[1]="Sélectionnez une option"
		dial[2]="Quitter l'installation"
		dial[3]="Compléter l'installation"
		dial[4]="Installer le point d'accès"
		dial[5]="Arrêter la machine"
	else
		dial[0]="What do you want to do now ?"
		dial[1]="Select one option"
		dial[2]="Quit the installation"
		dial[3]="Complete installation"
		dial[4]="Install the hotspot"
		dial[5]="Shutdown now"
	fi
	option=$(dialog --title "${dial[0]}" --menu "${dial[1]}" 12 60 6 1 "${dial[2]}" 2 "${dial[3]}"\
				 3 "${dial[4]}" 4 "${dial[5]}" 3>&1 1>&2 2>&3)
# Get exit status
# 0 means user hit [yes] button.
# 1 means user hit [no] button.
# 255 means user hit [Esc] key.
	response=$?
	case $option in
	1)
		echo "Quit"
		exit
		;;
	2)
		echo "back to install software"
		;;
	3)
		echo "Install hotspot"
		sudo $(pwd)/install_hotspot.sh
		;;
	4)
		echo "Reboot"
		sudo shutdown now
		;;
	255)
		echo "[ESC] key pressed."
		;;
	esac
done

