################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébasien Durand
# 			
# On Sept 05 2017
# V0.1
################################################
#!/bin/bash -i
######
# Recherche du répertoire ConfigTinker
######

figlet -k Install IP_Indicator
echo "================================================="
echo "================================================="


######
# basic update
######
sudo apt-get update
######
# Installation des pré-requis
######
# sudo apt-get -y install libatk-adaptor libgail-common gsettings-ubuntu-schemas 
# sudo apt-get -y install libido3-0.1-dev  libgee-0.8-dev liburl-dispatcher1-dev
# sudo apt-get -y install indicator-application indicator-messages indicator-sound
version=`lsb_release -c -s`
#if [[ ${version} == "xenial" ]]
#then
#    sudo apt-get -y install indicator-messages-gtk2
#fi
#if [[ ${version} == "bionic" ]]
#then
#    sudo apt-get -y install indicator-application-gtk2 indicator-sound-gtk2
#fi
######
# Add PPA
######
# sudo apt-add-repository -y ppa:bovender/bovender
sudo add-apt-repository -y ppa:nico-marcq/indicator-ip

######
# Installation du programme : IP_Indicator
######
sudo apt-get -y install gcc python3-dev python3-gi python3-gi-cairo libcairo2-dev python3-netifaces python3-requests
sudo apt-get -y install libjpeg-dev libgif-dev gir1.2-gtk-3.0 gobject-introspection libgirepository1.0-dev pkg-config gir1.2-appindicator3-0.1
sudo apt-get -y install python3-indicator-ip

######
# Detect language
######
lang=$(locale | grep LANG= | grep fr_FR)
if [[ ${lang} == *"fr_FR"* ]]
then
	echo "ajouter l'Applet de notification général au tableau de bord pour afficher ip_indicator"
else
	echo "add General Applet notification at dashboard for see ip_indicator"
fi
