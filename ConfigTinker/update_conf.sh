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
if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=${nafabox_path}
######
cd ${dirinstall}
server_choice=$2
sudo apt-get -o Dpkg::Options::="--force-overwrite" -f install
######
# Fonction pour l'installation
######
installconf()
{
    if [[ $3 == "server" ]]
    then
        echo "############################"
        echo "## install in server mode ##"
        echo "############################"
        ${dirinstall}/install_kstars.sh $3
	    ${dirinstall}/install_comsetup.sh $3


    elif [[ $3 == "default" ]]
    then
        echo "############################"
        echo "## install in default mode ##"
        echo "############################"
        ${dirinstall}/install_kstars.sh $3
	    ${dirinstall}/install_comsetup.sh $3
        ${dirinstall}/install_phd2.sh
	    
    else
	    if $1
	    then
		    dial[0]="Installation/Mise à jour des logiciels"
		    dial[1]="Choisir le(s) logiciel(s) à installer"
		    choice[0]="Installation Kstars-EKOS-INDI"
		    choice[1]="Couche de communication web"
		    choice[2]="Installation Phd2"
		    choice[3]="Installation Lin_guider"
		    choice[4]="installation de Carte du ciel (Beta)"
		    choice[5]="Installation Ccdciel (Beta)"
		    choice[6]="Installation OACapture (Beta)"
		    choice[7]="Installation logiciel de traitement d'image"
		    choice[8]="Installation Stellarium"
		    choice[9]="Telechargement du/des index(s) astrometrique"
	    else
		    dial[0]="Install/Update of software"
		    dial[1]="Choose software(s) to install"
		    choice[0]="Install Kstars-EKOS-INDI"
		    choice[1]="Web communication layer"
		    choice[2]="Phd2"
		    choice[3]="Lin_guider"
		    choice[4]="Skychart (Beta)"
		    choice[5]="Ccdciel (Beta)"
		    choice[6]="OACapture (Beta)"
		    choice[7]="Image processing software"
		    choice[8]="Stellarium"
		    choice[9]="install astrometry index(s)"
	    fi

	    message[0]="Install kstars-ekos-indi"
	    message[1]="Install web communications"
	    message[2]="Install phd2"
	    message[3]="Install Lin_guider"
	    message[4]="Install Skychart"
	    message[5]="Install ccdciel"
	    message[6]="Install OACapture"
	    message[7]="Install image processing software"
	    message[8]="Install stellarium"
	    message[9]="Install index(s)"

      script[0]=install_kstars.sh
	    script[1]=install_comsetup.sh
	    script[2]=install_phd2.sh
	    script[3]=install_linguider.sh
	    script[4]=install_skychart.sh
	    script[5]=install_ccdciel.sh
	    script[6]=install_oacapture.sh
	    script[7]=install_traitement.sh
	    script[8]=install_stellarium.sh
	    script[9]=install_index.sh


	    if [[ $2 == "initial" ]]
	    then
		    st=(true true true false false false false false false false)

	    else
		    st=(false false false false false false false false false false)
	    fi

	    # nombre de logiciel
	    number=10

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
		    "" "${st[0]}" "${st[1]}" "${st[2]}" \
		    "${st[3]}" "${st[4]}" "${st[5]}" "${st[6]}" \
		    "${st[7]}" "${st[8]}" "${st[9]}"`
	    then
		    for (( i=0; i<=$number-1; i++ ))
		    do
			    j=$(($i+2))
			    re=$(echo "$chose" | cut -d "|" -f${j})
			    if [[ ${re} == "TRUE" ]]
			    then
				    ${dirinstall}/${script[$i]} | tee -a "$dirinstall/nafabox.log"
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
if [[ ${lang} == *"fr_FR"* ]]
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
	installconf ${french} $1 $2
######
# Reboot required
######
	if [[ ${server_choice} == "server" ]]
	then
        echo "#########################################################"
        echo "#########################################################"
        echo "End of Server mode installation"
		echo "need reboot after install"
		exit
	elif [[ ${server_choice} == "default" ]]
	then
        echo "#########################################################"
        echo "#########################################################"
        echo "End of Default mode installation"
		echo "need reboot after install"
		exit
	else
		if ${french}
		then
			dial[0]="Voulez-vous maintenant ?"
			dial[1]="Sélectionnez une option"
			dial[2]="Quitter l'installation"
			dial[3]="Compléter l'installation"
			dial[4]="Redémarer la machine"
		else
			dial[0]="What do you want to do now ?"
			dial[1]="Select one option"
			dial[2]="Quit the installation"
			dial[3]="Complete installation"
			dial[4]="Reboot now"
		fi
		if option=`yad --width 400 \
					--center \
					--entry \
					--title "${dial[0]}" \
					--image=gnome-shutdown \
					--text "${dial[1]}" \
					--entry-text "${dial[2]}" "${dial[3]}" "${dial[4]}"`
		then
			if [[ ${option} == "${dial[2]}" ]]
			then
				echo "Quit"
				exit
			elif [[ ${option} == "${dial[3]}" ]]
			then
				echo "back to install software"
			elif [[ ${option} == "${dial[4]}" ]]
			then
				echo "Reboot"
				sudo reboot
			fi
		else
			echo "[ESC] key pressed."
		fi
	fi
done

