################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#!/bin/bash -i
######
# Recherche du répertoire ConfigTinker
######
if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=${nafabox_path}

figlet -k Install CCDciel
echo "================================================="
echo "================================================="
######
# Installation des pré-requis
######

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA716FC2
#echo "deb http://www.ap-i.net/apt unstable main" > /tmp/skychart.list
#sudo mv /tmp/skychart.list /etc/apt/sources.list.d/skychart.list
sudo apt-add-repository 'deb http://www.ap-i.net/apt unstable main'
sudo apt-get update

sudo apt-get -y install libpango1.0-0 xplanet espeak indistarter skychart-data-dso skychart-data-pictures eqmodgui
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

sudo apt-get -y install ccdciel

######
# Création de l'icône sur le bureau
######
${dirinstall}/install_shortcut.sh APPNAME="ccdciel" OPTION="0"

