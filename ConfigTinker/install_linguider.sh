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

figlet -k Install LinGuider
echo "================================================="
echo "================================================="

######
# Remember where I am
######
whereiam=${dirinstall}
######
# Installation des pré-requis
######
sudo apt-get -y install g++
sudo apt-get -y install libusb-1.0-0-dev
sudo apt-get -y install libqt4-dev
######
# Installation du programme : lin_guider
#      Récupération
#      Compilation
#      Installation
######
version="4.2.0"
file="lin_guider-4.2.0.tar.bz2"
mkdir -p /tmp/linguider
wget https://sourceforge.net/projects/linguider/files/${version}/${file} -P /tmp/linguider
tar xvjf /tmp/linguider/${file} -C /tmp/linguider
# Pour la compilation on se déplace dans le répertoire expansé linguider
cd /tmp/linguider/lin_guider_pack/lin_guider
echo "Configuration $dirinstall"
./configure
echo "Make"
make
sudo cp lin_guider /usr/bin/.
######
# Création de l'icône sur le bureau
######
sudo cp rc/lin_guider.png /usr/share/pixmaps/.
cd ${whereiam}
${dirinstall}/install_shortcut.sh lin_guider




