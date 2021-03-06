################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
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

machine=$(sudo lshw | grep "produit\|product" | grep "Raspberry")
if [[ ${machine} == *"Raspberry"* ]]
then
    echo "stellarium requires too much power for a raspberry 3b/3b+"
#exit
fi
figlet -k Install Stellarium
echo "================================================="
echo "================================================="

######
# Installation des pré-requis
######
######
# détection de l'architecture
######
source ${dirinstall}/proctype.sh
######
# add repository
######
sudo add-apt-repository -y ppa:stellarium/stellarium-releases
######
# basic update
######
sudo apt-get update
######
# Installation du programme : stellarium
######
sudo apt-get -y install stellarium
######
# Création de l'icône sur le bureau
######
${dirinstall}/install_shortcut.sh APPNAME='stellarium' OPTION='1' TERMINAL="false"

