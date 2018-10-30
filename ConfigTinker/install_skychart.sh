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
if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=$nafabox_path
######

figlet -k Install SkyChart
echo "================================================="
echo "================================================="

######
# Installation des pré-requis
######
#$dirinstall/install_libpasastro.sh | tee -a "$dirinstall/nafabox.log"
######
# détection de l'architecture
######
#source $dirinstall/proctype.sh
######
# Installation du programme : cartes du ciel
######
#software="skychart"
#version="version_4.0"
#file="skychart_4.0-3575b$proc.deb"
#wget https://sourceforge.net/projects/$software/files/1-software/$version/$file -P /tmp
#sudo dpkg -i /tmp/$file
######
# Installation d'un catalogue minimal
######
#file="skychart-data-stars_4.0-3421_all.deb"
#wget https://sourceforge.net/projects/$software/files/2-catalogs/Stars/$file -P /tmp
#sudo dpkg -i /tmp/$file

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA716FC2
#echo "deb http://www.ap-i.net/apt stable main" > /tmp/skychart.list
#sudo mv /tmp/skychart.list /etc/apt/sources.list.d/skychart.list
sudo apt-add-repository 'deb http://www.ap-i.net/apt stable main'
sudo apt-get update
sudo apt-get install skychart skychart-data-stars

######
# Création de l'icône sur le bureau
######
$dirinstall/install_shortcut.sh skychart


