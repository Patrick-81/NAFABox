################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#!/bin/bash
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$(head -n 1 temp_directory.tmp)

######
options="--auto-remove --yes -q"

figlet -k Install PHD2
echo "================================================="
echo "================================================="

######
# Installation des pré-requis
######
sudo apt-add-repository -y ppa:pch/phd2
sudo apt update
######
# Installation du programme : phd2
######
sudo apt-get $options install phd2
######
# Création de l'icône sur le bureau
######
$dirinstall/install_shortcut.sh phd2

