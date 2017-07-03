#!/bin/bash
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$(find ~ -name ConfigTinker)
######
# pre-requis
######
installed=$(apt -qq list uuid)
testinstall=$([[ $(grep "install" <<< $installed) ]] && echo true || echo false)

if $testinstall 
#if test -z "$installed"
then
	echo "installé"
else
	echo "installation uuid"
	sudo apt -y install uuid
fi
exit
######
# detect language
######
source $dirinstall/detect_language.sh
######
# recupere le user
######
moi=$(whoami)
######
# Get mac_address
######
# get wifi device
device=$(basename $(find /sys/class/net -name wl*))
if test ! -z $device
then
	mac_address=$(sudo cat /sys/class/net/$device/address)
######
# Créer l'uuid
######
	hsuuid=$(uuid)
######
# Création du hotspot
######
	OUTPUT=$(tempfile)
	# cleanup  - add a trap that will remove $OUTPUT
	# if any of the signals - SIGHUP SIGINT SIGTERM it received.
	trap "rm $OUTPUT; exit" SIGHUP SIGINT SIGTERM
	default_hostname="$moi"
	if $french
	then
		dial[0]="Fixer un nom discriminant pour votre hotspot"
		dial[1]="Soyez créatif d'autres personnes peuvent aussi utiliser une NAFABox"
		dial[2]="Nom original pour votre hotspot ou défaut"
	else
		dial[0]="Give a discriminant name for your hotspot"
		dial[1]="Be creative other people close to you may also use a NAFABox"
		dial[2]="Original name for your hotspot or default"
	fi
	# Demande du nom de hotspot
	dialog --clear \
		--title "${dial[0]}" \
		--backtitle "${dial[1]}" \
		--inputbox "${dial[2]}" \
		8 60 $default_hostname \
		2>$OUTPUT
	reponse=$?
	# make a decsion 
	case $reponse in
  	0) 
		hotspot_name=$(<$OUTPUT)"box"
  		;;
  	1) 
		exit
  		;;
  	255) 
   		echo "[ESC] key pressed."
		exit
		;;
	esac
	fic0=$(tempfile)
	cat $dirinstall/nafabox.template | sed -e "s/wlan0/${device}/g" > $fic0
	fic1=$(tempfile)
	cat $fic0 | sed -e "s/HOTSPOTNAME/${hotspot_name}/g" > $fic1
	fic2=$(tempfile)
	cat $fic1 | sed -e "s/UUID/${hsuuid}/g" > $fic2
	fic3=$(tempfile)
	cat $fic2 | sed -e "s/MAC_ADDRESS/${mac_address}/g" > $fic3
######
# Find active access point
######
	activeap=$(iw $device info | grep ssid | cut -f 2 -d" ")
	if test ! -z $activeap
	then
		sudo rm -f /etc/NetworkManager/system-connections/$activeap
	fi
######
# Create new one
######
	sudo cp $fic3 /etc/NetworkManager/system-connections/$hotspot_name
	sudo systemctl stop NetworkManager
	sleep 5
	sudo systemctl start NetworkManager
else
	echo "No wifi decice found"
fi


