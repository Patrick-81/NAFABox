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
# Recherche du répertoire ConfigTinker
######
if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=$nafabox_path
######
cd $dirinstall
server_choice=$2
######
# Fonction pour l'installation
######
installconf()
{
if [[ $2 == "server" ]]
then
	$dirinstall/install_comsetup.sh $2
	$dirinstall/install_kstars.sh $2
	
else
	if $1
	then
		dial[0]="Installation/Mise à jour des logiciels"
		dial[1]="Choisir le(s) logiciel(s) à installer"
	else
		dial[0]="Install/Update of software"
		dial[1]="Choose software(s) to install"
	fi

	if $1
	then
		choice[0]="Couche de communication web"
		choice[1]="Installation Lin_guider"
		choice[2]="Installation Kstars-EKOS-INDI"
		choice[3]="Installation Phd2"
		choice[4]="installation de Carte du ciel (Beta)"
		choice[5]="Installation Ccdciel (Beta)"
		choice[6]="Installation Planetary Imager (Beta)"
		choice[7]="Installation OACapture"
		choice[8]="Installation Siril (Beta)"
		choice[9]="Installation Stellarium"
		choice[10]="Telechargement du/des index(s) astrometrique"
		choice[11]="installation de astroberry_diy"


	else
		choice[0]="Web communication layer"
		choice[1]="Lin_guider"
		choice[2]="Install Kstars-EKOS-INDI"
		choice[3]="Phd2"
		choice[4]="Skychart"
		choice[5]="Ccdciel"
		choice[6]="Planetary Imager"
		choice[7]="OACapture"
		choice[8]="Siril"
		choice[9]="Stellarium"
		choice[10]="install astrometry index(s)"
		choice[11]="install astroberry_diy"
	fi


	message[0]="Install web communications"
	message[1]="Install Lin_guider"
	message[2]="Install kstars-ekos-indi"
	message[3]="Install phd2"
	message[4]="Install Skychart"
	message[5]="Install ccdciel"
	message[6]="Install planetary imager"
	message[7]="Install OACapture"
	message[8]="Install siril"
	message[9]="Install stellarium"
	message[10]="Install index(s)"
	message[11]="Install astroberry_diy"

	script[0]=install_comsetup.sh
	script[1]=install_linguider.sh
	script[2]=install_kstars.sh
	script[3]=install_phd2.sh
	script[4]=install_skychart.sh
	script[5]=install_ccdciel.sh
	script[6]=install_planetaryimager.sh
	script[7]=install_oacapture.sh
	script[8]=install_siril.sh
	script[9]=install_stellarium.sh
	script[10]=install_index.sh
	script[11]=install_astroberry_diy.sh


	if [[ $2 == "initial" ]]
	then
		st=(true false true true false false false false false false false false)

	else
		st=(false false false false false false false false false false false false)
	fi

	# nombre de logiciel
	number=12

	# echo ${st[*]}
	# echo ${choise[*]}
	# echo ${dial[*]}


	# affichage

	if chose=`yad --width=400 \
		--center \
		--form \
		--title="${dial[0]}" \
		--text="${dial[1]}" \
		--field=":LBL" \
		--field="${choice[0]}:CHK" \
		--field="${choice[1]}:CHK" \
		--field="${choice[2]}:CHK" \
		--field="${choice[3]}:CHK" \
		--field="${choice[4]}:CHK" \
		--field="${choice[5]}:CHK" \
		--field="${choice[6]}:CHK" \
		--field="${choice[7]}:CHK" \
		--field="${choice[8]}:CHK" \
		--field="${choice[9]}:CHK" \
		--field="${choice[10]}:CHK" \
		--field="${choice[11]}:CHK" \
		"" "${st[0]}" "${st[1]}" "${st[2]}" \
		"${st[3]}" "${st[4]}" "${st[5]}" "${st[6]}" \
		"${st[7]}" "${st[8]}" "${st[9]}" "${st[10]}" \
		"${st[11]}"`
	then
		for (( i=0; i<=$number-1; i++ ))
		do
			j=$(($i+2))
			re=$(echo "$chose" | cut -d "|" -f$j)
			if [[ $re == "TRUE" ]]
			then
				$dirinstall/${script[$i]} | tee -a "$dirinstall/nafabox.log"
			fi
		done
	else
		echo "cancel"
	fi
fi
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
	installconf $french $1 $2
######
# Reboot required
######
	if [[ $server_choice == "server" ]]
	then
		echo "need reboot after install"
	else
		if $french
		then
			dial[0]="Voulez-vous maintenant ?"
			dial[1]="Sélectionnez une option"
			dial[2]="Quitter l'installation"
			dial[3]="Compléter l'installation"
			dial[4]="Installer le point d'accès"
			dial[5]="Redémarer la machine"
		else
			dial[0]="What do you want to do now ?"
			dial[1]="Select one option"
			dial[2]="Quit the installation"
			dial[3]="Complete installation"
			dial[4]="Install the hotspot"
			dial[5]="Reboot now"
		fi
		if option=`yad --width 400 \
					--center \
					--entry \
					--title "${dial[0]}" \
					--image=gnome-shutdown \
					--text "${dial[1]}" \
					--entry-text "${dial[2]}" "${dial[3]}" "${dial[4]}" "${dial[5]}"`
		then
			if [[ $option == "${dial[2]}" ]]
			then
				echo "Quit"
				exit
			elif [[ $option == "${dial[3]}" ]]
			then
				echo "back to install software"
			elif [[ $option == "${dial[4]}" ]]
			then
				echo "Install hotspot"
				sudo $dirinstall/install_hotspot.sh | tee -a "$dirinstall/nafabox.log"
			elif [[ $option == "${dial[5]}" ]]
			then
				echo "Reboot"
				sudo reboot
			fi
		else
			echo "[ESC] key pressed."
		fi
	fi
done

