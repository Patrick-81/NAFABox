################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# On Juin 3 2019
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

figlet -k Install Mobindi
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
sudo apt-get install git cmake zlib1g-dev libcurl4-openssl-dev libgsl-dev libraw-dev libcfitsio-dev libjpeg-dev libpng-dev libcgicc-dev daemontools nginx
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
npm install
#######
# clonage mobindi dans ~/bin
#######
mkdir -p /home/$USER/Projects
cd /home/$USER/Projects
git clone https://github.com/pludov/mobindi.git
#######
# Compilation et lancement du serveur
#######
cd /home/$USER/Projects/mobindi && ./startup.sh
#######
# Scipt de lancement du serveur au login
#######
echo -e '#!/bin/bash'"\ncd /home/$USER/Projects/mobindi\nnpm start &\n" > /home/$USER/bin/mobindi_up.sh
chmod +x /home/$USER/bin/mobindi_up.sh
echo -e "[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=UI_Indi
Comment=Contrôle de Indi
Exec=/home/$USER/bin/mobindi_up.sh
StartupNotify=false
Terminal=false
Hidden=false" > /home/$USER/.config/autostart/mobindi.desktop
chmod +x /home/$USER/.config/autostart/mobindi.desktop

