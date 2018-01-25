################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébasien Durand
# 			
# On Sept 05 2017
# V0.1
################################################
#!/bin/bash
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$(find ~ -name ConfigTinker)
######
# Add PPA
######
sudo apt-add-repository ppa:bovender/bovender
######
# basic update
######
sudo apt-get update
######
# Installation des pré-requis
######
sudo apt-get -y install mate-indicator-applet libatk-adaptor libgail-common 
sudo apt-get -y install indicator-application-gtk2 indicator-messages-gtk2 indicator-sound-gtk2
######
# détection de l'architecture
######
source $dirinstall/proctype.sh
######
# Installation du programme : IP_Indicator
######

sudo apt-get -y install indicator-ip

######
# Detect language
######
lang=$(locale | grep LANG= | grep fr_FR)
if [[ $lang == *"fr_FR"* ]]
then
	echo "ajouter l'Applet de notification général au tableau de bord pour afficher ip_indicator"
else
	echo "add General Applet notification at dashboard for see ip_indicator"
fi
