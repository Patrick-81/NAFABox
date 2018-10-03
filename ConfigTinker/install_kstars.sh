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
dirinstall=$(head -n 1 temp_directory.tmp)
######
options="--auto-remove --yes -q"

figlet -k Install Kstars Ekos Indi
echo "================================================="
echo "================================================="

######
# detect language
######
source detect_language.sh | tee -a "$dirinstall/nafabox.log"
######
# Installation des pré-requis
######
sudo apt-add-repository -y ppa:mutlaqja/ppa
sudo apt update
if $french
then
	sudo apt-get $options language-pack-kde-fr
fi
sudo apt-get $options install gsc
sudo apt-get $options install libqt5sql5-sqlite
######
# Installation du programme : kstars
#              du serveur : indi
#              de tous les drivers
######
sudo apt-get $options install indi-full kstars-bleeding
sudo apt-get $options install indi-dbg kstars-bleeding-dbg
######
# Installation des drivers 3rdparty qui ne sont pas sous forme de dépot
######
$dirinstall/install_other3rdparty_drivers.sh | tee -a "$dirinstall/nafabox.log"
######
# Installer le pad amélioré
######
$dirinstall/install_pad.sh | tee -a "$dirinstall/nafabox.log"
######
# Installation du web manager pour indi
######
$dirinstall/install_indiwebmanager.sh | tee -a "$dirinstall/nafabox.log"
######
# Création de l'icône sur le bureau
######
$dirinstall/install_shortcut.sh kstars | tee -a "$dirinstall/nafabox.log"
######
# Installation du programme de résolution astrométrique
######
sudo apt-get $options install astrometry.net
######
# Installation des index
######
#$dirinstall/install_index.sh


