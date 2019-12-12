################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
#			Sébastien Durand
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

figlet -k Install 3rd Party Driver
echo "================================================="
echo "================================================="

######
# detect processeur
######
source ${dirinstall}/proctype.sh

######
# Installation du driver : atikccd
######

# test proc version
#if [[ $proc == "_amd64" ]]
#then
#	type="amd64"
#elif [[ $proc == "_armhf" ]]
#then
#	type="armhf"
#elif [[ $proc == "_x86" ]]
#then
#	type="i386"
#fi

#version="1.30"
#software="atikccd"
#file="$software""-""$version""-""$type"".deb"
#echo $file
#wget http://download.cloudmakers.eu/$file -P /tmp/
#sudo dpkg -i /tmp/$file
#sudo cp /usr/local/share/indi/indi_atik.xml /usr/share/indi/
#sudo systemctl restart indiwebmanager.service

sudo apt-get install -y libatik indi-atik


######
# Installation du driver : inova
######
# détection de l'architecture
#case $(uname -p) in
#"armv7l") 
#    proc="_arm-linux-gnueabihf"
#    ;;
#"x86_64")
#    proc="_x86_64-linux-gnu"
#    ;;
#esac
#software="indi-inova-ccd-"
#version="$software""1.3.0"
#file="$version""$proc.deb"
#echo $file
#wget http://www.inova-ccd.fr/download/E.\ Drivers/Linux/$file -P /tmp/
#sudo dpkg -i /tmp/$file
sudo apt-get install -y indi-inovaplx indi-inovaplx-dbg libinovasdk

######
# Installation du driver : altair
######
# sudo apt install indi-altaircam


sudo apt-get install -f
