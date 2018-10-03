#!/bin/bash
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$nafabox_path

figlet -k Install 3rd Party Driver
echo "================================================="
echo "================================================="

######
# Installation du driver : atikccd
######
# détection de l'architecture
case $(uname -p) in
"armv7l") 
    proc="-armhf"
    ;;
"x86_64")
    proc="-amd64"
    ;;
esac
software="atikccd"
version="$software""-""1.29"
file="$version""$proc.deb"
echo $file
wget http://download.cloudmakers.eu/$file -P /tmp/
sudo dpkg -i /tmp/$file
######
# Installation du driver : inova
######
# détection de l'architecture
case $(uname -p) in
"armv7l") 
    proc="_arm-linux-gnueabihf"
    ;;
"x86_64")
    proc="_x86_64-linux-gnu"
    ;;
esac
software="indi-inova-ccd-"
version="$software""-""1.3.0"
file="$version""$proc.deb"
echo $file
wget http://www.inova-ccd.fr/download/E.\ Drivers/Linux/$file -P /tmp/
sudo dpkg -i /tmp/$file
sudo apt install -f

