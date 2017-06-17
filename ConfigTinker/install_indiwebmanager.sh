################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#/bin/bash
######
# pre-req
#####
sudo apt-get -y install python-requests python-psutil python-bottle
######
# installation des sources du serveur
######
wget https://github.com/knro/indiwebmanager/archive/master.zip -P /tmp/.
unzip /tmp/master.zip -d ~/
cd ~/indiwebmanager\-master
cp -rf servermanager ~/
######
# Installation du service
######
moi=$USER
cat indiwebmanager.service | sed -e "s/pi/${moi}/g" > /tmp/indiwebmanager.service
sudo cp /tmp/indiwebmanager.service /lib/systemd/system/
sudo chmod 644 /lib/systemd/system/indiwebmanager.service
######
# enregistrer/lancer le service
######
sudo systemctl daemon-reload
sudo systemctl enable indiwebmanager.service
sudo systemctl start indiwebmanager
