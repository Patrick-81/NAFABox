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

figlet -k Install LibPasAstro
echo "================================================="
echo "================================================="

######
# Installation de libpasastro via sourceforge

#source ${dirinstall}/proctype.sh
#software="libpasastro"
#version="version_1.4.1"
#file="libpasastro_1.4.1-51_$proc.deb"
#wget https://sourceforge.net/projects/${software}/files/${version}/${file} -P /tmp/
#sudo dpkg -i /tmp/${file}

# Install via PPA

sudo add-apt-repository -y ppa:pch/ppa-skychart
sudo apt-get install -y libpasastro
