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

figlet -k Install PlanetaryImager
echo "================================================="
echo "================================================="

######
# Installation des pré-requis
######
sudo apt-get -y install libccfits0v5 libopencv-highgui2.4v5 libqt5opengl5 libv4l-0 libv4lconvert0
######
# détection de l'architecture
######
case $(uname -p) in
"armv7l") 
	proc="armv7"
	code="AABmt2KGu8THriaSPnkt3cD0a"
	;;
"x86_64")
	proc="x86_64"
	code="AABRn_pACN8l0_jsjTJqed1Ga"
	;;
esac
######
# Installation du programme : cartes du ciel
######
software="PlanetaryImager"
version="0.7.0"
#site="https://github.com/GuLinux/$software/releases/download/v$version"
site="https://www.dropbox.com/sh/7ofjp0s6gbelff4/$code/releases"
#file="$software-$version-Linux-$proc""_ubuntu-16.04.deb"
file="$software-$version-Linux-$proc""_ubuntu-16.04.deb"
#wget $site/$file -P /tmp/
wget $site/$version/$file -P /tmp/ --no-check-certificate
sudo dpkg --force overwrite -i /tmp/$file
######
# Création de l'icône sur le bureau
######
sudo cp /usr/share/icons/hicolor/24x24/apps/planetary_imager.png /usr/share/pixmaps
$dirinstall/install_shortcut.sh planetary_imager

