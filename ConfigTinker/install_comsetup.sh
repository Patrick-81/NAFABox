################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
# v0.2  ajout de browsepy (Patrick Dutoit)
################################################
#!/bin/bash
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$(find ~ -name ConfigTinker)
######
# recupere le user
######
moi=$(whoami)
data=$dirinstall
cd $dirinstall
######
# detect language
######
source detect_language.sh
######
# Définir time zone
######
sudo dpkg-reconfigure tzdata
######
# Installer nginx
######
sudo apt-get -y install nginx
######
# Installer php
######
sudo apt-get -y install php
######
# Creer le répertoire www
######
site=/home/$moi/www
mkdir -p /home/$moi/www
######
# Installer les fichiers nécessaires pour la mise à l'heure
# en remote
######
# le fichier html d'accès au site
if $french
then
	dial[0]="Actualiser la date"
	dial[1]="Date==>NAFABox"
	dial[2]="Date actualisée a"
	dial[3]="Pour la mise a l'heure se connecter sur le boitier
avec l'adresse IP de ce dernier qui differe selon qu'il
est soit en reseau domestique soit en mode point d'acces."
else
	dial[0]="Actuate Date"
	dial[1]="Update hour"
	dial[2]="Date and time updated to"
	dial[3]="To update remote date do connect to the box with its
IP adress which is different if it is on home network or access point"
fi
echo "Dirinstall "$dirinstall
cat index.html | sed -e "s/ACTUATE/${dial[0]}/g" > $site/index.html
cp setdate.php $site/setdate.php
cp shutdown_reboot.php $site/shutdown_reboot.php
sudo chown www-data:www-data $site/setdate.php
sudo chown www-data:www-data $site/shutdown_reboot.php

######
# Pour les machines pour lesquelles le hanshake se passe mal
######
cat hotspotawake.service | sed -e "s/MOI/${moi}/g" > /tmp/hotspotawake.service
sudo cp /tmp/hotspotawake.service /etc/systemd/system/.
chmod +x hotspotawake.sh
cp hotspotawake.sh ~/bin/.
sudo systemctl stop hotspotawake.service
sudo systemctl disable hotspotawake.service
sudo systemctl daemon-reload
sudo systemctl enable hotspotawake.service
sudo systemctl start hotspotawake.service
###### 

cat sudoers.txt | sed -e "s/MOI/${moi}/g" > /tmp/sudoers
sudo cp /tmp/sudoers /etc/sudoers.d/perm$moi
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "${dial[3]}"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

######
# Installation du serveur nginx
######
sudo apt install -y --reinstall nginx
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default
cat $data/server.txt | sed -e "s/MOI/${moi}/g" > /tmp/site-$moi
sudo cp /tmp/site-$moi /etc/nginx/sites-available/site-$moi
sudo chown $moi:$moi /etc/nginx/sites-available/site-$moi
sudo ln -sf /etc/nginx/sites-available/site-$moi /etc/nginx/sites-enabled/site-$moi
######
# Install of webdav server
######
sudo $data/install_webdavserver.sh
######
# Install of browsepy
######
sudo $data/install_browsepy.sh
######
# Installation x11vnc
######
sudo apt -y install x11vnc
mkdir -p ~/.x11vnc
mkdir -p ~/bin/
cp $dirinstall/startx11vnc.sh ~/bin/
chmod +x ~/bin/startx11vnc.sh
~/bin/startx11vnc.sh
mkdir -p ~/.config/autostart/
cat $dirinstall/startx11vnc.desktop | sed -e "s/nafa/${moi}/g" > /tmp/startx11vnc.desktop
cp /tmp/startx11vnc.desktop ~/.config/autostart/
#
######
# Installation accès vnc via navigateur
######
sudo apt-get install -y novnc
sudo apt-get install -y git

cd /home/$moi
#
#test si le dossier noVNC existe, si oui suppression
#
if [ -d "/home/${moi}/noVNC" ]
  then
  echo "suppression de l'ancien dossier noVNC"
  rm -Rf /home/$moi/noVNC
fi

git clone git://github.com/kanaka/noVNC

if [ -f /etc/systemd/system/novnc.service ]
  then
  sudo systemctl stop novnc.service
  sudo systemctl disable novnc.service
  sudo rm /etc/systemd/system/novnc.service
fi

cat $data/novnc.service | sed -e "s/MOI/${moi}/g" > /tmp/novnc.service
sudo cp /tmp/novnc.service /etc/systemd/system/novnc.service
sudo chmod 644 /etc/systemd/system/novnc.service

sudo systemctl daemon-reload
sudo systemctl enable novnc.service
sudo systemctl start novnc.service


