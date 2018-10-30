################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
#				Sébastien Durand
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
# Fonction pour l'installation
######

cd $dirinstall
cd ..
cd ..


echo "suppression de l'ancien dossier NAFABOX"
rm -Rf $dirinstall/../

git clone https://github.com/Patrick-81/NAFABox.git
cd NAFABox
git checkout gui_zenity
echo "update script"
$dirinstall/install_conf.sh
