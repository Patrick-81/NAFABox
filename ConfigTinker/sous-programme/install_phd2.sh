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
#
####################################
# Installation du programme : phd2 #
####################################
#
sudo apt-get $options install phd2
#
# Création de l'icône sur le bureau
$dirinstall/sous-programme/install_shortcut.sh phd2
#
#################
# fin de script #
#################
#

