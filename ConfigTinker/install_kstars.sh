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
dirinstall=$nafabox_path
######
options="--auto-remove --yes -q"

figlet -k Install Kstars Ekos Indi
echo "================================================="
echo "================================================="
######
# detect language
######
source $dirinstall/detect_language.sh

# install PPA version :
######
# Installation des pré-requis
######
sudo apt-add-repository -y ppa:mutlaqja/ppa
sudo apt-get update
if $french
then
	sudo apt-get $options language-pack-kde-fr
fi
sudo apt-get $options install gsc
sudo apt-get $options install libqt5sql5-sqlite qtdeclarative5-dev


######
# Installation du programme : kstars
#              du serveur : indi
#              de tous les drivers
######

if [[ $1 == "kstars_dev" ]]
then
	sudo apt-get $options install build-essential cmake git libeigen3-dev libcfitsio-dev zlib1g-dev libindi-dev extra-cmake-modules libkf5plotting-dev libqt5svg5-dev libkf5xmlgui-dev kio-dev kinit-dev libkf5newstuff-dev kdoctools-dev libkf5notifications-dev libkf5crash-dev gettext libnova-dev libgsl-dev libraw-dev libkf5notifyconfig-dev wcslib-dev libqt5websockets5-dev qt5keychain-dev xplanet xplanet-images
	sudo apt-get $options install libusb-1.0-0-dev libjpeg-dev libcurl4-gnutls-dev
	sudo apt-get $options install libftdi-dev libgps-dev libdc1394-22-dev libgphoto2-dev libboost-dev libboost-regex-dev librtlsdr-dev liblimesuite-dev libftdi1-dev libfftw3-dev


	if [ -d "/home/${USER}/Projects/build/kstars" ]
	then
		echo "Update Kstars Dev"
		cd ~/Projects/kstars
		git pull
		cd ~/Projects/build/kstars
		make
		sudo make install
	else
		# install Kstars dev
		echo "Install Kstars Dev"
		mkdir -p ~/Projects/build/kstars
		cd ~/Projects
		git clone git://anongit.kde.org/kstars.git
		cd ~/Projects/build/kstars
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/kstars
		make
		sudo make install
	fi

elif [[ $1 == "indi_dev" ]]
then
	sudo apt-get $options install build-essential cmake git libeigen3-dev libcfitsio-dev zlib1g-dev libindi-dev extra-cmake-modules libkf5plotting-dev libqt5svg5-dev libkf5xmlgui-dev kio-dev kinit-dev libkf5newstuff-dev kdoctools-dev libkf5notifications-dev libkf5crash-dev gettext libnova-dev libgsl-dev libraw-dev libkf5notifyconfig-dev wcslib-dev libqt5websockets5-dev qt5keychain-dev xplanet xplanet-images
	sudo apt-get $options install libusb-1.0-0-dev libjpeg-dev libcurl4-gnutls-dev
	sudo apt-get $options install libftdi-dev libgps-dev libdc1394-22-dev libgphoto2-dev libboost-dev libboost-regex-dev librtlsdr-dev liblimesuite-dev libftdi1-dev libfftw3-dev

	if [ -d "/home/${USER}/Projects/build/libindi" ]
	then
		echo "Update Indi Dev"
		cd ~/Projects/indi
		git pull
		cd ~/Projects/build/libindi
		make
		sudo make install
	else
		# install indi dev
		echo "Install Indi Dev"
		mkdir -p ~/Projects
		cd ~/Projects
		git clone https://github.com/indilib/indi.git
		mkdir -p build/libindi
		cd ~/Projects/build/libindi
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/indi/libindi
		make
		sudo make install
	fi

	if [ -d "/home/${USER}/Projects/build/3rdparty" ]
	then
		echo "Update Indi3rd Dev"
		cd ~/Projects/indi
		git pull
		cd ~/Projects/build/3rdparty
		make
		sudo make install
	else
		# install indi3rd dev
		echo "Install Indi3rd Dev"
		cd ~/Projects
		mkdir -p build/3rdparty
		cd ~/Projects/build/3rdparty
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/indi/3rdparty
		make
		sudo make install
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/indi/3rdparty
		make
		sudo make install
	fi

elif [[ $1 == "all_dev" ]]
then
	sudo apt-get $options install build-essential cmake git libeigen3-dev libcfitsio-dev zlib1g-dev libindi-dev extra-cmake-modules libkf5plotting-dev libqt5svg5-dev libkf5xmlgui-dev kio-dev kinit-dev libkf5newstuff-dev kdoctools-dev libkf5notifications-dev libkf5crash-dev gettext libnova-dev libgsl-dev libraw-dev libkf5notifyconfig-dev wcslib-dev libqt5websockets5-dev qt5keychain-dev xplanet xplanet-images
	sudo apt-get $options install libusb-1.0-0-dev libjpeg-dev libcurl4-gnutls-dev
	sudo apt-get $options install libftdi-dev libgps-dev libdc1394-22-dev libgphoto2-dev libboost-dev libboost-regex-dev librtlsdr-dev liblimesuite-dev libftdi1-dev libfftw3-dev

	if [ -d "/home/${USER}/Projects/build/libindi" ]
	then
		echo "Update Indi Dev"
		cd ~/Projects/indi
		git pull
		cd ~/Projects/build/libindi
		make
		sudo make install
	else
		# install indi dev
		echo "Install Indi Dev"
		mkdir -p ~/Projects
		cd ~/Projects
		git clone https://github.com/indilib/indi.git
		mkdir -p build/libindi
		cd ~/Projects/build/libindi
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/indi/libindi
		make
		sudo make install
	fi

	if [ -d "/home/${USER}/Projects/build/3rdparty" ]
	then
		echo "Update Indi3rd Dev"
		cd ~/Projects/indi
		git pull
		cd ~/Projects/build/3rdparty
		make
		sudo make install
	else
		# install indi3rd dev
		echo "Install Indi3rd Dev"
		cd ~/Projects
		mkdir -p build/3rdparty
		cd ~/Projects/build/3rdparty
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/indi/3rdparty
		make
		sudo make install
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/indi/3rdparty
		make
		sudo make install
	fi

	if [ -d "/home/${USER}/Projects/build/kstars" ]
	then
		echo "Update Kstars Dev"
		cd ~/Projects/kstars
		git pull
		cd ~/Projects/build/kstars
		make
		sudo make install
	else
		# install Kstars dev
		echo "Install Kstars Dev"
		mkdir -p ~/Projects/build/kstars
		cd ~/Projects
		git clone git://anongit.kde.org/kstars.git
		cd ~/Projects/build/kstars
		cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ~/Projects/kstars
		make
		sudo make install
	fi
else
	sudo apt-get $options install indi-full kstars-bleeding
	sudo apt-get $options install indi-dbg kstars-bleeding-dbg
fi
######
# Installation des drivers 3rdparty qui ne sont pas sous forme de dépot
######
$dirinstall/install_other3rdparty_drivers.sh
######
# Installer le pad amélioré
######
#$dirinstall/install_pad.sh
######
# Installation du web manager pour indi
######
$dirinstall/install_indiwebmanager.sh
######
# Création de l'icône sur le bureau
######
$dirinstall/install_shortcut.sh kstars
######
# Installation du programme de résolution astrométrique
######
sudo apt-get $options install astrometry.net
######
# Installation des index
######
#$dirinstall/install_index.sh


