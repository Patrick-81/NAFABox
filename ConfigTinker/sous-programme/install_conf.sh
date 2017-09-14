################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
# script appelé par go.sh
################################################
#!/bin/bash
#
dirinstall=$(find ~ -name ConfigTinker)
#
##################
# option for apt #
##################
#
options="--auto-remove --yes -q"
#
#################
# pré-requis    #
# pre requisite #
#################
#
sudo apt-add-repository -y ppa:mutlaqja/ppa
sudo apt-add-repository -y ppa:pch/phd2	
sudo apt update
sudo apt-get $options install libpangox-1.0-0 libespeak1 libpango1.0-0 \
libsonic0 espeak-data fonts-freefont-ttf ttf-freefont libjpeg62 libglu1 \
xplanet espeak qt4-default openssh-server uuid
#
#############################
# Installer les utilitaires #
# Install utilities         #
#############################
#
mkdir -p ~/bin
#
# Modificateur de résolution
#
$dirinstall/sous-programme/install_setres.sh
#
# Installation de conf_updater
#
cp $dirinstall/sous-programme/update_conf.sh ~/bin/.
chmod +x ~/bin/update_conf.sh
sudo ln -sf ~/bin/update_conf.sh /usr/bin/update_conf
sudo cp /usr/share/icons/gnome/32x32/apps/system-software-update.png /usr/share/pixmaps/update_conf.png
#
# Création du raccourci pour update_conf
#
$dirinstall/install_shortcut.sh update_conf "mate-terminal -e \"/bin/bash update_conf\"" 
#
~/bin/update_conf.sh initial
#
###############################################
# Création du raccourci pour install_index.sh #
###############################################
#
cp $dirinstall/sous-programme/install_index.sh ~/bin/.
sudo ln -sf ~/bin/install_index.sh /usr/bin/install_index
sudo cp $dirinstall/annexe/install_index.png /usr/share/pixmaps/.
sudo cp $dirinstall/annexe/index.txt ~/bin/.
$dirinstall/sous-programme/install_shortcut.sh install_index "mate-terminal -e \"/bin/bash install_index\"" 
#
#################################################
# Création du raccourci pour install_hotspot.sh #
#################################################
#
cp $dirinstall/sous-programme/install_hotspot.sh ~/bin/.
sudo ln -sf ~/bin/install_hotspot.sh /usr/bin/install_hotspot
sudo cp $dirinstall/annexe/install_hotspot.png /usr/share/pixmaps/.
$dirinstall/sous-programme/install_shortcut.sh install_hotspot "mate-terminal -e \"/bin/bash install_hotspot\""
#
################################################ 
# Création du raccourci pour switch_laguage.sh #
################################################
#
cp $dirinstall/sous-programme/switch_language.sh ~/bin/.
sudo ln -sf ~/bin/switch_language.sh /usr/bin/switch_language
sudo cp /usr/share/icons/gnome/48x48/apps/config-language.png /usr/share/pixmaps/switch_language.png
$dirinstall/sous-programme/install_shortcut.sh switch_language "mate-terminal -e \"/bin/bash switch_language\""
#
############################################ 
# Création du raccourci pour setup_time.sh #
############################################
#
cp $dirinstall/sous-programme/setup_time.sh ~/bin/.
sudo ln -sf ~/bin/setup_time.sh /usr/bin/setup_time
sudo cp $dirinstall/annexe/setup_time.png /usr/share/pixmaps/.
$dirinstall/sous-programme/install_shortcut.sh setup_time "mate-terminal -e \"/bin/bash setup_time\""
#
########################
# fin de scrpit second #
########################
#
exit
