################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#!/bin/bash
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$(find ~ -name ConfigTinker)
######
# Statut d'installation
# Installation status
######
touch $dirinstall/install-status.txt
######
# option for apt
######
options="--auto-remove --yes -q"
######
# Install mate
######
if [[ -z $(cat $dirinstall/install-status.txt | grep mate) ]]
then
	$dirinstall/install_base.sh
	echo mate >> $dirinstall/install-status.txt
fi
######
# pré-requis
# pre requisite
######
if [[ -z $(cat install-status.txt | grep prereq) ]]
then
	sudo apt-add-repository -y ppa:mutlaqja/ppa
	sudo apt-add-repository -y ppa:pch/phd2	
	sudo apt update
	sudo apt-get $options install libpangox-1.0-0 libespeak1 libpango1.0-0 \
	libsonic0 espeak-data fonts-freefont-ttf ttf-freefont libjpeg62 libglu1 \
	xplanet espeak qt4-default openssh-server uuid
	echo prereq >> $dirinstall/install-status.txt
fi
######
# Installer les utilitaires
# Install utilities
######
mkdir -p ~/bin
# Modificateur de résolution
# Resolution modifier
$dirinstall/install_setres.sh
######
# Install conf updater
######
cp update_conf.sh ~/bin/.
chmod +x ~/bin/update_conf.sh
sudo ln -sf ~/bin/update_conf.sh /usr/bin/update_conf
sudo cp /usr/share/icons/gnome/32x32/apps/system-software-update.png /usr/share/pixmaps/update_conf.png
# Création du raccourci pour update_conf
$dirinstall/install_shortcut.sh update_conf "mate-terminal -e \"/bin/bash update_conf\"" 
######
# Install/Update conf
######
~/bin/update_conf.sh initial
######
# Création du raccourci pour install_index.sh
######
cp $dirinstall/install_index.sh ~/bin/.
sudo ln -sf ~/bin/install_index.sh /usr/bin/install_index
sudo cp $dirinstall/install_index.png /usr/share/pixmaps/.
sudo cp $dirinstall/index.txt ~/bin/.
$dirinstall/install_shortcut.sh install_index "mate-terminal -e \"/bin/bash install_index\"" 
######
# Création du raccourci pour install_hotspot.sh
######
cp $dirinstall/install_hotspot.sh ~/bin/.
sudo ln -sf ~/bin/install_hotspot.sh /usr/bin/install_hotspot
sudo cp $dirinstall/install_hotspot.png /usr/share/pixmaps/.
$dirinstall/install_shortcut.sh install_hotspot "mate-terminal -e \"/bin/bash install_hotspot\""
##### 
# Création du raccourci pour switch_laguage.sh
######
cp $dirinstall/switch_language.sh ~/bin/.
sudo ln -sf ~/bin/switch_language.sh /usr/bin/switch_language
sudo cp /usr/share/icons/gnome/48x48/apps/config-language.png /usr/share/pixmaps/switch_language.png
$dirinstall/install_shortcut.sh switch_language "mate-terminal -e \"/bin/bash switch_language\""



