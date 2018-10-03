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

figlet -k Install CCDciel
echo "================================================="
echo "================================================="
######
# Installation des pré-requis
######
sudo apt-add-repository 'deb http://www.ap-i.net/apt unstable main'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA716FC2
sudo apt-get update
sudo apt install libpango1.0-0 xplanet espeak indistarter skychart-data-dso skychart-data-pictures
#$dirinstall/install_libpasastro.sh
######
# détection de l'architecture
######
#source $dirinstall/proctype.sh
######
# Installation du programme : ccdciel
######
#software="ccdciel"
#version="$software""_""0.9.8"
#subversion="533"
#file="$version""-$subversion""$proc.deb"
#echo $file
#wget https://sourceforge.net/projects/$software/files/$version/$file -P /tmp/
#sudo dpkg -i /tmp/$file
######
# Installation du programme : ccdciel + libpasastro via ppa
######

sudo apt-get -y --allow-unauthenticated install ccdciel

######
# Création de l'icône sur le bureau
######
$dirinstall/install_shortcut.sh ccdciel

