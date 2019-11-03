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

figlet -k Install PlanetaryImager
echo "================================================="
echo "================================================="

######
# detect processeur
######
source ${dirinstall}/proctype.sh

if [[ ${proc} == "_aarch64" ]]
then
	echo "planetary imager is not compatible with arm64 board"
	exit
fi

######
# Installation des pré-requis
######
sudo apt-get -y install libccfits-dev libopencv-dev libqt5opengl5 libv4l-0 libv4lconvert0 
sudo apt-get -y install gcc libboost-all-dev fxload git cmake qtbase5-dev qtdeclarative5-dev

if [[ -d "/tmp/libdc1394" ]]
then
	rm -Rf /tmp/libdc1394
fi
# Install libdc1394
wget https://sourceforge.net/projects/libdc1394/files/libdc1394-2/2.2.5/libdc1394-2.2.5.tar.gz -P /tmp/libdc1394
tar zxvf /tmp/libdc1394/libdc1394-2.2.5.tar.gz -C /tmp/libdc1394
cd /tmp/libdc1394/libdc1394-2.2.5/
./configure
make
sudo make install

 # Install dependency for flycapture2 SDK

sudo apt-get -y install libraw1394-11 libgtkmm-2.4-dev libglademm-2.4-dev libgtkglextmm-x11-1.2-dev libusb-1.0-0
echo "==========================================================================================="
echo " For install Point Grey Cam need download and Install FlyCapture2 SDK in point grey Website"
echo "==========================================================================================="
######
# détection de l'architecture
######
#case $(uname -p) in
#"armv7l") 
#	proc="armv7"
#	code="AABmt2KGu8THriaSPnkt3cD0a"
#	;;
#"x86_64")
#	proc="x86_64"
#	code="AABRn_pACN8l0_jsjTJqed1Ga"
#	;;
#esac
######
# Installation du programme : Planetary Imager
######
echo "==========================================================================================="
echo " warning desactivate miniconda/anaconda for install planetary imager"
echo "==========================================================================================="
if [[ -d "/tmp/planetary" ]]
then
	rm -Rf /tmp/planetary
fi
mkdir /tmp/planetary/
cd /tmp/planetary/
git clone --recursive -b v0.7 https://github.com/GuLinux/PlanetaryImager.git
cd PlanetaryImager/
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make all && sudo make install

#software="PlanetaryImager"
#version="0.7.0"
#site="https://github.com/GuLinux/$software/releases/download/v$version"
#site="https://www.dropbox.com/sh/7ofjp0s6gbelff4/$code/releases"
#file="$software-$version-Linux-$proc""_ubuntu-16.04.deb"
#file="$software-$version-Linux-$proc""_ubuntu-16.04.deb"
#wget $site/$file -P /tmp/
#wget $site/$version/$file -P /tmp/ --no-check-certificate
#sudo dpkg --force overwrite -i /tmp/$file
######
# Création de l'icône sur le bureau
######
sudo cp /usr/share/icons/hicolor/16x16/apps/planetary_imager.png /usr/share/pixmaps
${dirinstall}/install_shortcut.sh APPNAME='planetary_imager' OPTION='1' TERMINAL="false"

