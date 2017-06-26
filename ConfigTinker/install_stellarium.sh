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
# détection de l'architecture
######
source $(pwd)/proctype.sh
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
$(pwd)/install_shortcut.sh stellarium

