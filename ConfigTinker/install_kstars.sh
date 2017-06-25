################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#!/bin/bash
options="--auto-remove --yes -q"
######
# detect language
######
source detect_language.sh
######
# Installation des pré-requis
######
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
######
# Installer le pad amélioré
######
$(pwd)/install_pad.sh
######
# Installation du web manager pour indi
######
$(pwd)/install_indiwebmanager.sh
######
# Création de l'icône sur le bureau
######
$(pwd)/install_shortcut.sh kstars
######
# Installation du programme de résolution astrométrique
######
sudo apt-get $options install astrometry.net
######
# Installation des index
######
$(pwd)/install_index.sh


