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
sudo apt-get -y install libccfits0v5 libopencv-highgui2.4v5 libqt5opengl5 libv4l-0 libv4lconvert0
#
# détection de l'architecture
#
case $(uname -p) in
"armv7l") 
	proc="armv7"
	;;
"x86_64")
	proc="x86_64"
	;;
esac
#
###############################################
# Installation du programme : PlanetaryImager #
###############################################
#
software="PlanetaryImager"
version="0.6.2"
site="https://github.com/GuLinux/$software/releases/download/v$version"
file="$software-$version-Linux-$proc""_ubuntu-16.04.deb"
wget $site/$file -P /tmp/
sudo dpkg --force overwrite -i /tmp/$file
sudo apt-get -f
sudo dpkg --force overwrite -i /tmp/$file
#
#####################################
# Création de l'icône sur le bureau #
#####################################
#
sudo cp /usr/share/icons/hicolor/32x32/apps/planetary_imager.png /usr/share/pixmaps/
$dirinstall/sous-programme/install_shortcut.sh planetary_imager
#
#################
# fin de script #
#################
#

