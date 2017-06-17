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
# Remember where I am
######
whereiam=$(pwd)
######
# Installation des pré-requis
######
######
# Installation du programme : lin_guider
#      Récupération
#      Compilation
#      Installation
######
version="4.2.0"
file="lin_guider-4.2.0.tar.bz2"
mkdir -p /tmp/linguider
wget https://sourceforge.net/projects/linguider/files/$version/$file -P /tmp/linguider
tar xvjf /tmp/linguider/$file -C /tmp/linguider
# Pour la compilation on se déplace dans le répertoire expansé linguider
cd /tmp/linguider/lin_guider_pack/lin_guider
echo "Configuration $(pwd)"
./configure
echo "Make"
make
sudo cp lin_guider /usr/bin/.
######
# Création de l'icône sur le bureau
######
sudo cp rc/lin_guider.png /usr/share/pixmaps/.
cd $whereiam
$(pwd)/install_shortcut.sh lin_guider




