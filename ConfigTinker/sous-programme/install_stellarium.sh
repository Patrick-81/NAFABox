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
# détection de l'architecture
#
source $dirinstall/sous-programme/proctype.sh
#
# add repository
#
sudo add-apt-repository -y ppa:stellarium/stellarium-releases
#
# basic update
#
sudo apt-get update
#
##########################################
# Installation du programme : stellarium #
##########################################
#
sudo apt-get -y install stellarium
#
#####################################
# Création de l'icône sur le bureau #
#####################################
#
$dirinstall/sous-programme/install_shortcut.sh stellarium
#
#################
# fin de script #
#################
#

