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

figlet -k Install CCDciel
echo "================================================="
echo "================================================="
######
# Installation des pré-requis
######

######
# détection de l'architecture
######
source $dirinstall/proctype.sh

# install libpasastro
$dirinstall/install_libpasastro.sh

######
# install via "PPA" outdate
######

#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA716FC2
#echo "deb http://www.ap-i.net/apt unstable main" > /tmp/skychart.list
#sudo mv /tmp/skychart.list /etc/apt/sources.list.d/skychart.list
#sudo apt-add-repository 'deb http://www.ap-i.net/apt unstable main'
#sudo apt-get update

sudo apt-get -y install libpango-1.0-0 xplanet espeak
#sudo apt-get -y install ccdciel indistarter eqmodgui


######
# install via sourceforge
######

# install indistarter via sourceforge

software="indistarter"

#need update
version="$software""-""2.3.2"
subversion="185"

file="$version""-$subversion""$proc.deb"
wget https://sourceforge.net/projects/$software/files/$version/$file -P /tmp
sudo apt-get -y install /tmp/$file

# install eqmodgui via sourceforge

software="eqmodgui"

#need update
version="$software""_""1.7.1"
subversion="149"

file="$version""-$subversion""$proc.deb"
wget https://sourceforge.net/projects/$software/files/$version/$file -P /tmp
sudo apt-get -y install /tmp/$file

# Installation de ccdciel

software="ccdciel"

#need update
version="$software""_""0.9.82"
subversion="2979"

file="$version""-$subversion""$proc.deb"
wget https://sourceforge.net/projects/$software/files/$version/$file -P /tmp/
sudo apt-get -y install /tmp/$file


######
# Création de l'icône sur le bureau
######
${dirinstall}/install_shortcut.sh APPNAME="ccdciel" OPTION="1" TERMINAL="false"

