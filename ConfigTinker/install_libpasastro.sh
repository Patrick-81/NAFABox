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
dirinstall=${PWD}
######
# Installation de libpasastro
source $dirinstall/proctype.sh
software="libpasastro"
version="version_1.1-19"
file="libpasastro_1.1-19$proc.deb"
wget https://sourceforge.net/projects/$software/files/$version/$file -P /tmp/
sudo dpkg -i /tmp/$file
