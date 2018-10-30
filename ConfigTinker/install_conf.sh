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
if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=$nafabox_path

######
# Statut d'installation
# Installation status
######
#touch $dirinstall/install-status.txt
######
# option for apt
######
options="--auto-remove --yes -q"
######
# Install mate
######
#if [[ -z $(cat $dirinstall/install-status.txt | grep mate) ]]
#then
$dirinstall/install_base.sh

figlet -k Install Configuration
echo "================================================="
echo "================================================="
#	echo mate >> $dirinstall/install-status.txt
#fi
######
# pré-requis
# pre requisite
######
#if [[ -z $(cat install-status.txt | grep prereq) ]]
#then

sudo apt-get $options install libpangox-1.0-0 libespeak1 libpango1.0-0
sudo apt-get $options install libsonic0 espeak-data fonts-freefont-ttf
version=lsb_release -c -s
if [[ $version == "xenial" ]]
then
	sudo apt-get $options install ttf-freefont 
fi
sudo apt-get $options install libjpeg62 libglu1
sudo apt-get $options install xplanet espeak qt4-default openssh-server uuid
#	echo prereq >> $dirinstall/install-status.txt
#fi
######
# Installer les utilitaires
# Install utilities
######
mkdir -p ~/bin

# Modificateur de résolution
# Resolution modifier
$dirinstall/install_setres.sh | tee -a "$dirinstall/nafabox.log"
######
# Install conf updater
######
cp $dirinstall/update_conf.sh ~/bin/.
chmod +x ~/bin/update_conf.sh
sudo ln -sf ~/bin/update_conf.sh /usr/bin/update_conf
sudo cp /usr/share/icons/gnome/32x32/apps/system-software-update.png /usr/share/pixmaps/update_conf.png
# Création du raccourci pour update_conf
$dirinstall/install_shortcut.sh update_conf "bash -ic update_conf"

######
# Install/Update conf
######

figlet -k Install Configuration
echo "================================================="
echo "================================================="

~/bin/update_conf.sh initial

######
# Création du raccourci pour install_index.sh
######

cp $dirinstall/install_index.sh ~/bin/install_index.sh
sudo ln -sf ~/bin/install_index.sh /usr/bin/install_index
sudo cp $dirinstall/install_index.png /usr/share/pixmaps/install_index.png
cp $dirinstall/index.txt ~/bin/index.txt
$dirinstall/install_shortcut.sh install_index "bash -ic install_index"

######
# Création du raccourci pour install_hotspot.sh
######

cp $dirinstall/install_hotspot.sh ~/bin/install_hotspot.sh
sudo ln -sf ~/bin/install_hotspot.sh /usr/bin/install_hotspot
sudo cp $dirinstall/install_hotspot.png /usr/share/pixmaps/install_hotspot.png
$dirinstall/install_shortcut.sh install_hotspot "bash -ic install_hotspot\"

##### 
# Création du raccourci pour switch_language.sh
######

cp $dirinstall/switch_language.sh ~/bin/switch_language.sh
sudo ln -sf ~/bin/switch_language.sh /usr/bin/switch_language
sudo cp /usr/share/icons/gnome/48x48/apps/config-language.png /usr/share/pixmaps/switch_language.png
$dirinstall/install_shortcut.sh switch_language "bash -ic switch_language\"

##### 
# Création du raccourci pour setup_time.sh
######

$dirinstall/install_setup-time.sh | tee -a "$dirinstall/nafabox.log"

##### 
# Création du programme d'upadet des scripts
######

cp $dirinstall/update_nafabox.sh ~/bin/update_nafabox.sh
sudo ln -sf ~/bin/update_nafabox.sh /usr/bin/update_nafabox.sh
sudo cp /usr/share/icons/gnome/48x48/apps/system-software-update.png /usr/share/pixmaps/update_conf.png
$dirinstall/install_shortcut.sh update_nafabox "bash -ic update_nafabox"
