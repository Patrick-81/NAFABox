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
# detect processeur
######
source $dirinstall/proctype.sh

if [[ $proc == "_aarch64" ]]
then
	echo "OAcapture is in BETA in arm64 board"
fi
######
# Installation des pré-requis
#######
sudo pip install pyinstaller
sudo apt install imagemagick-6.q16
######
# Clonage de sirilic
######
mkdir -p /home/$USER/Projects
cd /home/$USER/Projects
git clone https://gitlab.com/free-astro/sirilic.git
######
# Installation
######
cd /home/$USER/Projects/sirilic/package
./MakePackage.sh
sudo cp dist/* /usr/local/bin/.
cd ..
######
# Installer un mini UI pour lancer Sirilic ou Sirilot ou SirilRemote
######
cp ${dirinstall}/SirilicMiniUI.sh /home/$USER/bin/.
chmod +x /home/$USER/bin/SirilicMiniUI.sh
sudo ln -sf /home/$USER/bin/SirilicMiniUI.sh /usr/local/bin/SirilicMiniUI
convert cp-neg.ico cp-neg.png
sudo cp  cp-neg.png /usr/share/pixmaps/Sirilic.png
${dirinstall}/install_shortcut.sh APPNAME='sirilic'  APPEXEC='SirilicMiniUI' TERMINAL='false' OPTION='0'
figlet -k Fin Install Sirilic

