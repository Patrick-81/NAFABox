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

figlet -k Install Siril
echo "================================================="
echo "================================================="

######
# Installation des pré-requis
######
sudo apt-get -y install libconfig++9v5 libffms2-4 libraw15
sudo apt-get -y install -f
######
# Options de apt-get pour l'installation des paquets
######
options="--autoremove -y -q"
######
# add repository
######
sudo apt-add-repository -y ppa:lock042/siril
######
# basic update
######
sudo apt-get update
######
# Installation du programme : siril
######
sudo apt-get ${options} install siril

# add folder for script :
mkdir -p /home/${USER}/siril/script
mkdir -p /home/${USER}/.siril/script


######
# Création de l'icône sur le bureau
######
sudo cp /usr/share/icons/hicolor/32x32/apps/siril.png /usr/share/pixmaps/.
${dirinstall}/install_shortcut.sh APPNAME='siril'

