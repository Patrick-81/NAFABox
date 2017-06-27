#!/bin/bash
######
# pre-requis
######
sudo apt -y install uuid
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
	hotspot_name="$moi""box"
	fic0=$(tempfile)
	cat nafabox.template | sed -e "s/wlan0/${device}/g" > $fic0
	fic1=$(tempfile)
	cat $fic0 | sed -e "s/MOI/${moi}/g" > $fic1
	fic2=$(tempfile)
	cat $fic1 | sed -e "s/UUID/${hsuuid}/g" > $fic2
	fic3=$(tempfile)
	cat $fic2 | sed -e "s/MAC_ADDRESS/${mac_address}/g" > $fic3
	sudo cp $fic3 /etc/NetworkManager/system-connections/$hotspot_name
	sudo systemctl stop NetworkManager
	sleep 5
	sudo systemctl start NetworkManager
else
	echo "No wifi decice found"
fi


