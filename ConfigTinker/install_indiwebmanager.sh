################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
#
# Modified: Ludovic Dugue September 08 2017
#
# On June 10 2017
# V0.1
################################################
#/bin/bash

figlet -k Install IndiWebManager
echo "================================================="
echo "================================================="

######
# pre-req
#####

sudo apt-get install -y python-pip
sudo apt-get install -y python-setuptools
sudo apt-get install -y python-dev python3-dev
sudo apt-get install -y mlocate
sudo apt-get install -y python-bottle python-psutil python-requests
sudo chmod -R uga+rw /usr/local

# installation des sources du serveur
######
pip install --upgrade pip
pip install indiweb
#pip install indiweb --user

######
# Installation du service
######

dir=/etc/systemd/system   #mettre le chemin du service en memoire
MOI=$USER

sudo updatedb     # mettre à jour la base d'indexation

dirindiweb=$(locate indi-web)  #récupérer le chemin du binaire indi-web

echo -e '[UNIT]\nDescription=INDI Web Manager\nAfter=multi-user.target\n\n[Service]\nType=idle\nUser='$MOI'\nExecStart='$dirindiweb' -v\nRestart=Always\nRestartSec=5\n[Install]\nWantedBy=multi-user.target' >> /tmp/indiwebmanager.service
#echo -e '[UNIT]\nDescription=INDI Web Manager\nAfter=multi-user.target\n\n[Service]\nType=idle\nUser='$MOI'\nExecStart=/usr/local/bin/indi-web -v\nRestart=Always\nRestartSec=5\n[Install]\nWantedBy=multi-user.target' >> /tmp/indiwebmanager.service



sudo cp /tmp/indiwebmanager.service $dir/
sudo rm /tmp/indiwebmanager.service
sudo chmod 644 $dir/indiwebmanager.service

######
# enregistrer/lancer le service
######

sudo systemctl daemon-reload
sudo systemctl enable indiwebmanager.service
sudo systemctl start indiwebmanager
