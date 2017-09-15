################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
# script appelé par update_conf.sh
################################################
#!/bin/bash
#
dirinstall=$(find ~ -name ConfigTinker)
#
###################
# options apt-get #
###################
#
options="--auto-remove --yes -q"
####################################################
source $dirinstall/sous-programme/detect_language.sh
####################################################
#
###############################
# Installation des pré-requis #
###############################
#
if $french
then
	sudo apt-get $options language-pack-kde-fr
fi
sudo apt-get $options install gsc
sudo apt-get $options install libqt5sql5-sqlite
#
######################################
# Installation du programme : kstars #
#              du serveur : indi     #
#              de tous les drivers   #
######################################
#
sudo apt-get $options install indi-full kstars-bleeding
#
# Installation des drivers 3rdparty qui ne sont pas sous forme de dépot
#
$dirinstall/sous-programme/install_other3rdparty_drivers.sh
#
# Installer le pad amélioré
#
$dirinstall/sous-programme/install_pad.sh
#
# Installation du web manager pour indi
#
$dirinstall/sous-programme/install_indiwebmanager.sh
#
# Création de l'icône sur le bureau
#
$dirinstall/sous-programme/install_shortcut.sh kstars
#
# Installation du programme de résolution astrométrique
#
sudo apt-get $options install astrometry.net
#
#################
# fin de script #
#################
#

