#!/bin/bash
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$(find ~ -name ConfigTinker)
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
version="$software""-""1.24"
file="$version""$proc.deb"
echo $file
wget http://download.cloudmakers.eu/$file -P /tmp/
sudo dpkg -i /tmp/$file
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
#version="$software""-""1.3.0"
#file="$version""$proc.deb"
#echo $file
#wget http://download.cloudmakers.eu/$file -P /tmp/
#sudo dpkg -i /tmp/$file
sudo apt install -f

