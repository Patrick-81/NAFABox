################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
#
# On Feb 23 2023
# V0.1
################################################
#!/bin/bash -i
######
# Recherche du répertoire ConfigTinker
######
if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=${nafabox_path}

figlet -k Install AstroLiveStackig
echo "================================================="
echo "================================================="

branche="release/0.7"
tage="v0.7-beta1"
######
# Installation des pré-requis
######
sudo apt-get -y install git libraw-dev python3-dev python3-venv gcc python3-pip python3-setuptools python3-venv

if [[ -d "/home/${USER}/bin/als/" ]]
then
    # mise a jour
    echo "update ALS git"
    cd /home/${USER}/bin/als/
    git reset --hard
    git checkout ${tage}
else
    # installation
    echo "install ALS git"
    git clone https://github.com/gehelem/als.git -b ${tage}
    cd /home/${USER}/bin/als/
fi

echo "install venv python for ALS"
cd /home/${USER}/bin/als/
/home/${USER}/bin/als/venv_setup.sh

echo "install ALS"
python setup.py develop

######
# Création de l'icône sur le bureau
######
# sudo cp /usr/share/icons/hicolor/32x32/apps/siril.png /usr/share/pixmaps/.
# ${dirinstall}/install_shortcut.sh APPNAME='siril' OPTION='1' TERMINAL="false"

