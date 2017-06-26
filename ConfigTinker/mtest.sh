#!/bin/bash
######
# Detect language
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

	DIALOG=${DIALOG=dialog}
	fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
	trap "rm -f $fichtemp" 0 1 2 5 15

	$DIALOG --backtitle "${dial[0]}" \
		--title "${dial[1]}" --clear \
    	--checklist "${dial[2]}" 20 61 8 \
        	0 "${choice[0]}" on\
			1 "${choice[1]}" off\
			2 "${choice[2]}" on\
			3 "${choice[3]}" on\
			4 "${choice[4]}" off\
			5 "${choice[5]}" off\
			6 "${choice[6]}" off\
			7 "${choice[7]}" off \
			8 "${choice[8]}" off 2> $fichtemp
	valret=$?
	for n in $(cat $fichtemp)
	do
		case $n in
		0)
			echo "Install web communications"
#			$(pwd)/install_comsetup.sh
			echo com >> $(pwd)/install-status.txt
		;;
		1) 
			echo "Install Lin_guider"
#			$(pwd)/install_linguider.sh
			;;
		2)
			echo "Install kstars"
#			$(pwd)/install_kstars.sh
			;;
		3)
			echo "Install phd2"
#			$(pwd)/install_phd2.sh
			;;
		4)
			echo "Installation Skychart"
#			$(pwd)/install_skychart.sh
			;;
		5)
			echo "Install ccdciel"
#			$(pwd)/install_ccdciel.sh
			;;
		6)
			echo "Install planetary imager"
#			$(pwd)/install_planetaryimager.sh
			;;
		7)
			echo "Install siril"
#			$(pwd)/install_siril.sh
			;;
		8)
			echo "Install stellarium"
#			$(pwd)/install_stellarium.sh
			;;
		255)
			echo "escape";;
		esac
	done
}

lang=$(locale | grep LANG= | grep fr_FR)
if [[ $lang == *"fr_FR"* ]]
then
	french=true
else
	french=false
fi

while true
do
	installconf $french
######
# Reboot required
######
	if $french
	then
		dial[0]="Redémarrer la machine maintenant"
		dial[1]="Redémarrage si vous le souhaitez"
		dial[2]="Voulez-vous redémarrer maintenant ?"
	else
		dial[0]="Reboot now"
		dial[1]="Reboot as you want"
		dial[2]="Do you want top reboot ?"
	fi
	dialog --title "${dial[0]}" \
		--backtitle "${dial[1]}" \
		--yesno "${dial[1]}" 7 60
# Get exit status
# 0 means user hit [yes] button.
# 1 means user hit [no] button.
# 255 means user hit [Esc] key.
	response=$?
	case $response in
	0)
		echo "Reboot"
		exit
		;;
	1)
		echo "back to install software"
		;;
	255)
		echo "[ESC] key pressed."
		;;
	esac
done
