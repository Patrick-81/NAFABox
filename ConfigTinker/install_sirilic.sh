################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# Mod On Juin 20 2019
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

figlet -k Install Sirilic
echo "================================================="
echo "================================================="

######
# Installation des pré-requis
#######

sudo apt-get -y install python3 python3-pip imagemagick python3-wx*
# sudo pip3 install pyinstaller

######
# Clonage de sirilic
######
# mkdir -p /home/$USER/bin/
# cd /home/$USER/bin/
# git clone https://gitlab.com/free-astro/sirilic.git
######
# Installation
######
cd /tmp/
wget https://gitlab.com/free-astro/sirilic/uploads/56cc1649b374542cfc0f590ee1319799/python3-sirilic_1.12.4-1_all.deb
sudo ap-get -y install /tmp/python3-sirilic_1.12.4-1_all.deb
# cd /home/$USER/bin/sirilic/sirilic/package
# ./MakePackage.sh
# sudo cp dist/* /usr/local/bin/.
# cd ..
######
# Installer un mini UI pour lancer Sirilic ou Sirilot ou SirilRemote
######
# cp ${dirinstall}/SirilicMiniUI.sh /home/$USER/bin/.
# chmod +x /home/$USER/bin/SirilicMiniUI.sh
# sudo ln -sf /home/$USER/bin/SirilicMiniUI.sh /usr/local/bin/SirilicMiniUI
# convert cp-neg.ico cp-neg.png
# sudo cp  cp-neg.png /usr/share/pixmaps/Sirilic.png
# ${dirinstall}/install_shortcut.sh APPNAME='sirilic'  APPEXEC='SirilicMiniUI' TERMINAL='false' OPTION='0'
figlet -k Fin Install Sirilic

