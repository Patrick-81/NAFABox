################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# On Jan 1 2019
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

figlet -k Install OACapture
echo "================================================="
echo "================================================="

######
# detect processeur
######
source $dirinstall/proctype.sh

if [[ $proc == "_aarch64" ]]
then
	echo "OAcapture is in BETA in arm64 board"
fi

######
# Installation des pré-requis
#######
sudo apt-get -y install qt4-dev-tools qt4-qmake libqt4-dev
sudo apt-get -y install libv4l-dev libdc1394-22-dev libcfitsio-dev libudev-dev libtiff-dev gawk gcc g++ yasm autoconf libtool m4 automake libevent-dev pkg-config libhidapi-dev libpng-dev libsdl-dev libusb-dev libusb-1.0 libftdi-dev libraw1394-11 libgtkmm-2.4-1v5 libglademm-2.4-1v5 libgtkglextmm-x11-1.2-dev libgtkglextmm-x11-1.2 qt5-default fxload qtbase5-dev
sudo apt-get -y install libuvc-dev qttools5-dev-tools
# go at home
cd ~

if [ -d "/home/${USER}/openastro/" ]
then
	# mise a jour
	echo "update OACapture git"
	cd /home/$USER/openastro/
	sudo make uninstall
	sudo make clean
	git pull
else
	# installation
	echo "install OACapture git"
	git clone https://github.com/openastroproject/openastro.git

fi

cd /home/$USER/openastro/

# config openastro
set -x -e
autoreconf -fvi

# config libusb
cd ./ext/libusb
autoreconf -ivf

# config libdc1394
cd ..
cd libdc1394
autoreconf -fvi

# config libhidapi
cd ..
cd libhidapi
autoreconf -ivf
cd ../../

#install openastro
./configure
make
sudo make install

######
# Création de l'icône sur le bureau
######
$dirinstall/install_shortcut.sh oacapture 0

######
# Création de l'icône sur le bureau
######
$dirinstall/install_shortcut.sh oalive 0
