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
dirinstall=$(find ~ -name ConfigTinker)
######
options="--auto-remove --yes -q"
######
# Installation des pré-requis
######
######
# Installation du programme : phd2
######
sudo apt-get $options install phd2
######
# Création de l'icône sur le bureau
######
$dirinstall/install_shortcut.sh phd2

