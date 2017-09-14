################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			    Laurent Roge
# On June 10 2017
# V0.1
# script d'installation principal
################################################
#!/bin/bash
#set -xv
sudo apt-get update
sudo dpkg --configure -a
dirinstall=$(find ~ -name ConfigTinker)
cd $dirinstall
chmod +x ./*
chmod +x ./sous-programme/*
chmod +x ./annexe/*
#
./sous-programme/install_base.sh
#
./sous-programme/install_conf.sh
#
##########################
# fin du script primaire #
##########################
#
exit
