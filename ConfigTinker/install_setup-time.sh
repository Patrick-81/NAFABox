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
##### 
# Création du raccourci pour setup_time.sh
######
script="setup_time"
cp $dirinstall/$script.sh ~/bin/.
sudo ln -sf ~/bin/$script.sh /usr/bin/$script
sudo cp $dirinstall/$script.png /usr/share/pixmaps/.
$dirinstall/install_shortcut.sh $script "mate-terminal -e \"/bin/bash $script\""

