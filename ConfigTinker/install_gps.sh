################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébasien Durand
# 			
# On Sept 05 2017
# V0.1
################################################
#!/bin/bash
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$(head -n 1 temp_directory.tmp)
######
# Installation des pré-requis
######
######
# détection de l'architecture
######
source $dirinstall/proctype.sh | tee -a "$dirinstall/nafabox.log"
######
# basic update
######
sudo apt-get update
######
# Installation du programme : GPSD
######
sudo apt-get -y install gpsd gpsd-clients python-gps

