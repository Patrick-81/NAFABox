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

skychart_version="stable" #or beta
install_method="sourceforge" #of ppa

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

if [[ ${install_method} == "ppa" ]]
then
  # install via PPA
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B8B57C1AA716FC2

  if [[ ${skychart_version} == "stable" ]]
  then
    sudo rm /etc/apt/sources.list.d/skychart.list
    sudo apt-get update
    sudo sh -c "echo deb http://www.ap-i.net/apt stable main > /etc/apt/sources.list.d/skychart.list"
  elif [[ ${skychart_version} == "beta" ]]
  then
    sudo rm /etc/apt/sources.list.d/skychart.list
    sudo apt-get update
    sudo sh -c "echo deb http://www.ap-i.net/apt unstable main > /etc/apt/sources.list.d/skychart.list"
  fi
  sudo apt-get update

  sudo apt-get -y install skychart
  sudo apt-get -y install skychart-data-stars skychart-data-dso skychart-data-picture
fi

if [[ ${install_method} == "sourceforge" ]]
then

  software="skychart"

  if [[ ${skychart_version} == "stable" ]]
  then
    # install skychart via sourceforge stable

    #need update
    version="4.2.1"
    subversion="4073"

    file="$software"_""$version"-$subversion""$proc.deb"
    wget https://sourceforge.net/projects/$software/files/1-software/version_$version/$file -P /tmp
    sudo apt-get -y install /tmp/$file

  elif [[ ${skychart_version} == "beta" ]]
  then
    # install skychart via sourceforge beta

    #need update
    date="2023-09-18"
    version="4.3"
    subversion="4630"

    file="$software""_""$version""-$subversion""$proc.deb"
    wget https://sourceforge.net/projects/$software/files/0-beta/$date/$file -P /tmp
    sudo apt-get -y install /tmp/$file
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
  wget https://sourceforge.net/projects/skychart/files/2-catalogs/Stars/$file -P /tmp
  sudo apt-get -y install /tmp/$file

  # install skychart-data-dso via sourceforge

  software="skychart-data-dso"

  #need update
  version="4.0"
  subversion="3431"

  file="$software""_""$version""-$subversion""_all.deb"
  wget https://sourceforge.net/projects/skychart/files/2-catalogs/Nebulea/$file -P /tmp
  sudo apt-get -y install /tmp/$file

  # install via skychart-data-pictures sourceforge

  software="skychart-data-pictures"

  #need update
  version="4.0"
  subversion="3421"

  file="$software""_""$version""-$subversion""_all.deb"
  wget https://sourceforge.net/projects/skychart/files/2-catalogs/Nebulea/$file -P /tmp
  sudo apt-get -y install /tmp/$file

fi


######
# Création de l'icône sur le bureau
######
${dirinstall}/install_shortcut.sh APPNAME='skychart' OPTION='1' TERMINAL="false"


