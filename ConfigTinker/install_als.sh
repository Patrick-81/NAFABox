################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
#
# On Feb 23 2023
# V0.5
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

branche="release/0.7_22.04_ubuntu"
tage="v0.7-beta1"
######
# Installation des pré-requis
######
sudo apt-get -y install git libraw-dev python3-dev python3-venv gcc python3-pip python3-setuptools python3-venv python3-wheel python3 cython3

######
# Installation des dépendances principales d'als
######
sudo apt-get -y install python3-bottleneck python3-astropy python3-dtcwt python3-numpy python3-pyqt5 python3-watchdog pylint python3-sphinx python3-pytest python3-pytest-cov python3-coverage python3-numba python3-sphinx-rtd-theme python3-psutil python3-opencv python3-qrcode

######
# Installation de rawpy via git
######
python3 -m pip3 install git+https://github.com/letmaik/rawpy.git@v0.18.0

######
# Installation des dépendances secondaire d'als
######
sudo apt-get -y install python3-llvmlite python3-scipy python3-matplotlib python3-pil python3-pandas python3-importlib-metadata python3-more-itertools python3-networkx python3-certifi python3-idna python3-imageio python3-py python3-pygments python3-pyqt5.sip python3-requests python3-urllib3 python3-wcwidth python3-kiwisolver

######
# Installation des dépendances via pip
######
pip3 install astroalign pywi qimage2ndarray pyinstaller attrs

######
# Clone/update ALS
######
if [[ -d "/home/${USER}/bin/als/" ]]
then
    # mise a jour
    echo "update ALS git"
    cd /home/${USER}/bin/als/
    git reset --hard
    git checkout ${branche}
else
    # installation
    echo "install ALS git"
    git clone https://github.com/gehelem/als.git -b ${branche}
    cd /home/${USER}/bin/als/
fi

######
# Install ALS
######
cd /home/${USER}/bin/als/
echo "install ALS"
python setup.py develop


######
# Création de l'icône sur le bureau
######
# sudo cp /usr/share/icons/hicolor/32x32/apps/siril.png /usr/share/pixmaps/.
# ${dirinstall}/install_shortcut.sh APPNAME='siril' OPTION='1' TERMINAL="false"

