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
dirinstall=$nafabox_path

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
sudo apt-get $options install siril
######
# Création de l'icône sur le bureau
######
sudo cp /usr/share/icons/hicolor/32x32/apps/siril.png /usr/share/pixmaps/.
$dirinstall/install_shortcut.sh siril

