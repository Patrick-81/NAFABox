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
######

figlet -k Install SkyChart
echo "================================================="
echo "================================================="

skychart_version="stable"

######
# Installation des pré-requis
######
$dirinstall/install_libpasastro.sh | tee -a "$dirinstall/nafabox.log"

######
# détection de l'architecture
######
source $dirinstall/proctype.sh

######
# Installation du programme : cartes du ciel
######

sudo apt-get -y remove skychart
software="skychart"

if [[ ${skychart_version} == "stable" ]]
then
	# install skychart via sourceforge stable

	#need update
	version="4.2.1"
	subversion="4073"

	file="$software"_""$version"-$subversion""$proc.deb"
	wget https://sourceforge.net/projects/$software/files/1-software/version_$version/$file -P /tmp
	sudo dpkg -i /tmp/$file

elif [[ ${skychart_version} == "beta" ]]
then
	# install skychart via sourceforge beta

	#need update
	date="2022-05-02"
	version="4.3"
	subversion="4496"

	file="$software""_""$version""-$subversion""$proc.deb"
	wget https://sourceforge.net/projects/$software/files/0-beta/$date/$file -P /tmp
	sudo dpkg -i /tmp/$file
fi

######
# Installation des catalogues minimaux
######

# install skychart-data-stars via sourceforge

software="skychart-data-stars"

#need update
version="4.0"
subversion="3421"

file="$software""_""$version""-$subversion""_all.deb"
wget https://sourceforge.net/projects/$software/files/2-catalogs/Stars/$file -P /tmp
sudo dpkg -i /tmp/$file

# install skychart-data-dso via sourceforge

software="skychart-data-dso"

#need update
version="4.0"
subversion="3431"

file="$software""_""$version""-$subversion""_all.deb"
wget https://sourceforge.net/projects/$software/files/2-catalogs/Nebulea/$version/$file -P /tmp
sudo dpkg -i /tmp/$file

# install via skychart-data-pictures sourceforge

software="skychart-data-pictures"

#need update
version="4.0"
subversion="3421"

file="$software""_""$version""-$subversion""_all.deb"
wget https://sourceforge.net/projects/$software/files/2-catalogs/Nebulea/$version/$file -P /tmp
sudo dpkg -i /tmp/$file

# install via "PPA" outdate

#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA716FC2
#echo "deb http://www.ap-i.net/apt stable main" > /tmp/skychart.list
#sudo mv /tmp/skychart.list /etc/apt/sources.list.d/skychart.list
#sudo apt-add-repository 'deb http://www.ap-i.net/apt stable main'
#sudo apt-get update
#sudo apt-get install -y skychart skychart-data-stars

######
# Création de l'icône sur le bureau
######
${dirinstall}/install_shortcut.sh APPNAME='skychart' OPTION='1' TERMINAL="false"


