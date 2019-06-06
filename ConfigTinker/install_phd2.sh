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

######
options="--auto-remove --yes -q"

figlet -k Install PHD2
echo "================================================="
echo "================================================="

######
# Installation des pré-requis
######
sudo apt-add-repository -y ppa:pch/phd2
sudo apt-get update
######
# Installation du programme : phd2
######
sudo apt-get ${options} install phd2
######
# Création de l'icône sur le bureau
######
${dirinstall}/install_shortcut.sh APPNAME='phd2' OPTION='0'

