################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
# script appelé par install_skychart.sh / install_ccdciel.sh
################################################
#!/bin/bash
#
dirinstall=$(find ~ -name ConfigTinker)
#
###############################
# Installation de libpasastro #
###############################
#
# détéction de l'architecture
source $dirinstall/sous-programme/proctype.sh
#
software="libpasastro"
version="version_1.1-19"
file="libpasastro_1.1-19$proc.deb"
wget https://sourceforge.net/projects/$software/files/$version/$file -P /tmp/
sudo dpkg -i /tmp/$file
#
#################
# fin de script #
#################
#

