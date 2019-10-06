################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
#
# Modified: Ludovic Dugue September 08 2017
#
# On June 10 2017
# V0.1
################################################
#!/bin/bash -i

figlet -k Install NoMachine
echo "================================================="
echo "================================================="

######
# pre-req
#####

######
# Recherche du répertoire ConfigTinker
######
if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=${nafabox_path}

# ATTENTION : Need update $version and $sous_version

######
# detect processeur
######
source ${dirinstall}/proctype.sh

# test version
if [[ ${proc} == "_amd64" ]]
then
	type="amd64"
    type2="Linux"
    sous_version="1"
elif [[ ${proc} == "_armhf" ]]
then
	type="armhf"
    type2="Arm"
    sous_version="1"
elif [[ ${proc} == "_x86" ]]
then
	type="i386"
    type2="Linux"
    sous_version="1"
elif [[ ${proc} == "_aarch64" ]]
then
	type="arm64"
    type2="Arm"
    sous_version="1"
else
	echo "architecture not support"
    exit
fi

version="6.8.1"

file=nomachine_${version}_${sous_version}_${type}.deb

wget https://download.nomachine.com/download/${version}/${type2}/${file} -P /tmp/
sudo dpkg -i /tmp/${file}


# for keyboard bug correction :

######
# detect language
######
source ${dirinstall}/detect_language.sh

if ${french}
then
    localectl set-x11-keymap fr
else
    localectl set-x11-keymap us
fi

# ou sinon installer x2go :

#sudo apt-add-repository ppa:x2go/stable
#sudo apt-get update
#sudo apt-get -y install x2goserver x2goserver-xsession
