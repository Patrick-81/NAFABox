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
dirinstall=$(head -n 1 temp_directory.tmp)
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
choice[11]="install ip indicator"
choice[12]="install astroberry_diy"

message[0]="Install web communications"
message[1]="Install Lin_guider"
message[2]="Install kstars"
message[3]="Install phd2"
message[4]="Installation Skychart"
message[5]="Install ccdciel"
message[6]="Install planetary imager"
message[7]="Install siril"
message[8]="Install stellarium"
message[9]="Install GPSD"
message[10]="Install index(s)"
message[11]="Install IP_indicator"
message[12]="Install astroberry_diy"

script[0]=install_comsetup.sh
script[1]=install_linguider.sh
script[2]=install_kstars.sh
script[3]=install_phd2.sh
script[4]=install_skychart.sh
script[5]=install_ccdciel.sh
script[6]=install_planetaryimager.sh
script[7]=install_siril.sh
script[8]=install_stellarium.sh
script[9]=install_gps.sh
script[10]=install_index.sh
script[11]=install_ip_indicator.sh
script[12]=install_astroberry_diy.sh


if $init
then
	st=(true false true true false false false false false false false false)
	
else
	st=(false false false false false false false false false false false false)
fi
# echo ${st[*]}
# echo ${choise[*]}
# echo ${dial[*]}


# affichage
fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
error=`tempfile 2>/dev/null` || fichtemp=/tmp/error$$

zenity --title "${dial[1]}" \
	--width=400 --height=400 \
	--list \
	--checklist \
	--column "install" --column "Program" \
	"${st[0]}" "${choice[0]}" \
	"${st[1]}" "${choice[1]}" \
	"${st[2]}" "${choice[2]}" \
	"${st[3]}" "${choice[3]}" \
	"${st[4]}" "${choice[4]}" \
	"${st[5]}" "${choice[5]}" \
	"${st[6]}" "${choice[6]}" \
	"${st[7]}" "${choice[7]}" \
	"${st[8]}" "${choice[8]}" \
	"${st[9]}" "${choice[9]}" \
	"${st[10]}" "${choice[10]}" \
	"${st[11]}" "${choice[11]}" \
	"${st[12]}" "${choice[12]}" 1>$fichtemp 2>$error



# test 
for (( i=0; i<=11; i++ ))
do
	cat $fichtemp | grep -q "${choice[$i]}"
	if [ $? = 0 ]
	then
		$dirinstall/${script[$i]} | tee -a "$dirinstall/nafabox.log"
	fi
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
		sudo $dirinstall/install_hotspot.sh | tee -a "$dirinstall/nafabox.log"
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

