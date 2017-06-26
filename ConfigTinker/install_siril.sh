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
# Installation des pré-requis
######
######
# Options de apt-get pour l'installation des paquets
######
options="--auto-remove --yes -q"
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
$(pwd)/install_shortcut.sh siril

