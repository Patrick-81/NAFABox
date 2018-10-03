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
# Installation de libpasastro
source $dirinstall/proctype.sh | tee -a "$dirinstall/nafabox.log"
software="libpasastro"
version="version_1.1-19"
file="libpasastro_1.1-19$proc.deb"
wget https://sourceforge.net/projects/$software/files/$version/$file -P /tmp/
sudo dpkg -i /tmp/$file
