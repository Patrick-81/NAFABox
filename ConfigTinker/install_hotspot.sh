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
mac_address=$(sudo cat /sys/class/net/wlan0/address)
######
# Créer l'uuid
######
hsuuid=$(uuid)
######
# Création du hotspot
######
hotspot_name="$moi""box"
fic1=$(tempfile)
cat nafabox.template | sed -e "s/MOI/${moi}/g" > $fic1
fic2=$(tempfile)
cat $fic1 | sed -e "s/UUID/${hsuuid}/g" > $fic2
fic3=$(tempfile)
cat $fic2 | sed -e "s/MAC_ADDRESS/${mac_address}/g" > $fic3
sudo cp $fic3 /etc/NetworkManager/system-connections/$hotspot_name
sudo systemctl stop NetworkManager
sleep 5
sudo systemctl start NetworkManager



