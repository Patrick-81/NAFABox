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
# Recherche du répertoire ConfigTinker
######
dirinstall=$(find ~ -name ConfigTinker)
######
cd $dirinstall
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
		choice[9]="install GPSD pour GPS USB"
	else
		choice[0]="Web communication layer"
		choice[4]="Skychart"
		choice[9]="install GPSD for USB GPS"
	fi
	choice[1]="Lin_guider"
	choice[2]="Kstars"
	choice[3]="Phd2"
	choice[5]="Ccdciel"
	choice[6]="Planetary Imager"
	choice[7]="Siril"
	choice[8]="Stellarium"
	choice[10]="install astrometry index(s)"
	choice[11]="install ip_indicator"

	if $init
	then
		st=(on off on on off off off off off off off)
	else
		st=(off off off off off off off off off off off)
	fi		
	echo ${st[*]}

	DIALOG=${DIALOG=dialog}
	fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
	trap "rm -f $fichtemp" 0 1 2 5 15

	$DIALOG --backtitle "${dial[0]}" \
		--title "${dial[1]}" --clear \
    	--checklist "${dial[2]}" 20 61 9 \
        	0 "${choice[0]}" "${st[0]}"\
			1 "${choice[1]}" "${st[1]}"\
			2 "${choice[2]}" "${st[2]}"\
			3 "${choice[3]}" "${st[3]}"\
			4 "${choice[4]}" "${st[4]}"\
			5 "${choice[5]}" "${st[5]}"\
			6 "${choice[6]}" "${st[6]}"\
			7 "${choice[7]}" "${st[7]}"\
			8 "${choice[8]}" "${st[8]}"\
			9 "${choice[9]}" "${st[9]}"\
			10 "${choice[10]}" "${st[10]}"\
			11 "${choice[11]}" "${st[11]}"\
			 2> $fichtemp
	valret=$?
	for n in $(cat $fichtemp)
	do
		case $n in
		0)
			echo "Install web communications"
			$dirinstall/install_comsetup.sh
			;;
		1) 
			echo "Install Lin_guider"
			$dirinstall/install_linguider.sh
			;;
		2)
			echo "Install kstars"
			$dirinstall/install_kstars.sh
			;;
		3)
			echo "Install phd2"
			$dirinstall/install_phd2.sh
			;;
		4)
			echo "Installation Skychart"
			$dirinstall/install_skychart.sh
			;;
		5)
			echo "Install ccdciel"
			$dirinstall/install_ccdciel.sh
			;;
		6)
			echo "Install planetary imager"
			$dirinstall/install_planetaryimager.sh
			;;
		7)
			echo "Install siril"
			$dirinstall/install_siril.sh
			;;
		8)
			echo "Install stellarium"
			$dirinstall/install_stellarium.sh
			;;
		9)
			echo "Install GPSD"
			$dirinstall/install_gps.sh
			;;
		10)
			echo "Install index(s)"
			$dirinstall/install_index.sh
			;;
		11)
			echo "Install IP_indicator"
			$dirinstall/install_ip_indicator.sh
			;
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
		sudo $dirinstall/install_hotspot.sh
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

