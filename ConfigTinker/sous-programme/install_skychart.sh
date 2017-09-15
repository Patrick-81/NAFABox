################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
# script appelé par update_conf.sh
################################################
#!/bin/bash
#
dirinstall=$(find ~ -name ConfigTinker)
#
# Installation des pré-requis
#
$dirinstall/sous-programme/install_libpasastro.sh
#
# détection de l'architecture
#
source $dirinstall/sous-programme/proctype.sh
#
##############################################
# Installation du programme : cartes du ciel #
##############################################
#
software="skychart"
version="version_4.0"
file="skychart_4.0-3575b$proc.deb"
wget https://sourceforge.net/projects/$software/files/1-software/$version/$file -P /tmp
sudo dpkg -i /tmp/$file
#
#######################################
# Installation d'un catalogue minimal #
#######################################
#
file="skychart-data-stars_4.0-3421_all.deb"
wget https://sourceforge.net/projects/$software/files/2-catalogs/Stars/$file -P /tmp
sudo dpkg -i /tmp/$file
#
#####################################
# Création de l'icône sur le bureau #
#####################################
#
$dirinstall/sous-programme/install_shortcut.sh skychart
#
#################
# fin de script #
#################
#

