################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
# v0.2  ajout de browsepy (Patrick Dutoit)
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

figlet -k Install ComSetup
echo "================================================="
echo "================================================="
echo " Install time zone, Web Interface, X11VNC, WebDavServer, BrowsePy and NoVNC"
echo "================================================="
echo "================================================="

cd $dirinstall
######
# detect language
######
source $dirinstall/detect_language.sh

sudo apt-get update

if $french
then
	dial[0]="Installation/Mise à jour des logiciels"
	dial[1]="Choisir le(s) logiciel(s) à installer"
	choice[0]="Définir time zone"
	choice[1]="Installation Interface HTML"
	choice[2]="Installation X11VNC"
	choice[3]="Install WebDav"
	choice[4]="Installation BrowsePy"
	choice[5]="Installation NoVNC"

else
	dial[0]="Install/Update of software"
	dial[1]="Choose software(s) to install"
	choice[0]="define time zone"
	choice[1]="Install HTML Interface"
	choice[2]="Install X11VNC"
	choice[3]="Install WebDav"
	choice[4]="Install BrowsePy"
	choice[5]="Install NoVNC"

fi

st=(true true true true true true)

# interface de choix
if chose=`yad --width=400 \
	--center \
	--form \
	--title="${dial[0]}" \
	--text="${dial[1]}" \
	--field=":LBL" \
	--field="${choice[0]}:CHK" \
	--field="${choice[1]}:CHK" \
	--field="${choice[2]}:CHK" \
	--field="${choice[3]}:CHK" \
	--field="${choice[4]}:CHK" \
	--field="${choice[5]}:CHK" \
	"" "${st[0]}" "${st[1]}" "${st[2]}" \
	"${st[3]}" "${st[4]}" "${st[5]}"`
then
	time_z=$(echo "$chose" | cut -d "|" -f2)
	web=$(echo "$chose" | cut -d "|" -f3)
	xvnc=$(echo "$chose" | cut -d "|" -f4)
	dav=$(echo "$chose" | cut -d "|" -f5)
	browse=$(echo "$chose" | cut -d "|" -f6)
	novnc=$(echo "$chose" | cut -d "|" -f7)
else
	echo "cancel"
fi

if [[ $time_z == "TRUE" ]]
then
	######
	# Définir time zone
	######
	sudo dpkg-reconfigure tzdata
fi

if [[ $web == "TRUE" ]]
then
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
	site=/home/$USER/www
	mkdir -p /home/$USER/www
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
		dial[3]="Pour la mise a l\'heure se connecter sur le boitier
	avec l\'adresse IP de ce dernier qui differe selon qu\'il
	est soit en reseau domestique soit en mode point d\'acces."
	else
		dial[0]="Actuate Date"
		dial[1]="Update hour"
		dial[2]="Date and time updated to"
		dial[3]="To update remote date do connect to the box with its
	IP adress which is different if it is on home network or access point"
	fi
	#echo "Dirinstall "$dirinstall
	cat $dirinstall/index.html | sed -e "s/ACTUATE/${dial[0]}/g" > $site/index.html
	sudo systemctl stop nginx.service
	sudo cp $dirinstall/setdate.php $site/setdate.php
	sudo cp $dirinstall/shutdown_reboot.php $site/shutdown_reboot.php
	sudo chown www-data:www-data $site/setdate.php
	sudo chown www-data:www-data $site/shutdown_reboot.php
	sudo systemctl start nginx.service

	cat sudoers.txt | sed -e "s/MOI/${USER}/g" > /tmp/sudoers
	sudo cp /tmp/sudoers /etc/sudoers.d/perm$USER
	echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	echo "${dial[3]}"
	echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

	######
	# Installation du serveur nginx
	######
	sudo apt-get install -y --reinstall nginx
	sudo rm /etc/nginx/sites-available/default
	sudo rm /etc/nginx/sites-enabled/default
	cat $dirinstall/server.txt | sed -e "s/MOI/${USER}/g" > /tmp/site-$USER
	sudo cp /tmp/site-$USER /etc/nginx/sites-available/site-$USER
	sudo chown $USER:$USER /etc/nginx/sites-available/site-$USER
	sudo ln -sf /etc/nginx/sites-available/site-$USER /etc/nginx/sites-enabled/site-$USER

fi

######
# Pour les machines pour lesquelles le hanshake se passe mal
######
cat hotspotawake.service | sed -e "s/MOI/${USER}/g" > /tmp/hotspotawake.service
sudo cp /tmp/hotspotawake.service /etc/systemd/system/
chmod +x hotspotawake.sh
cp hotspotawake.sh ~/bin/
sudo systemctl stop hotspotawake.service
sudo systemctl disable hotspotawake.service
sudo systemctl daemon-reload
sudo systemctl enable hotspotawake.service
sudo systemctl start hotspotawake.service
###### 



if [[ $dav == "TRUE" ]]
then
	######
	# Install of webdav server
	######
	$dirinstall/install_webdavserver.sh
fi

if [[ $browse == "TRUE" ]]
then
	######
	# Install of browsepy
	######
	$dirinstall/install_browsepy.sh
fi

if [[ $xvnc == "TRUE" ]]
then
	######
	# Installation x11vnc
	######

	sudo apt-get -y install x11vnc

	# demarage sur la session 

	#mkdir -p ~/.x11vnc
	#mkdir -p ~/bin/
	#cp $dirinstall/startx11vnc.sh ~/bin/
	#chmod +x ~/bin/startx11vnc.sh
	#~/bin/startx11vnc.sh
	#mkdir -p ~/.config/autostart/
	#cat $dirinstall/startx11vnc.desktop | sed -e "s/nafa/${USER}/g" > /tmp/startx11vnc.desktop
	#cp /tmp/startx11vnc.desktop ~/.config/autostart/
	#

	# demarage sur le X11
	echo "Enter Le mot de passe VNC pour votre BOX :"
	sudo x11vnc -storepasswd /etc/x11vnc.pass
	echo "Merci ! ----------------------------------"
	# injection fichier system
	sudo cp $dirinstall/x11vnc.service /lib/systemd/system/x11vnc.service
	# allumage au démarage
	sudo systemctl daemon-reload
	sudo systemctl enable x11vnc.service
	echo "Need reboot for active VNC"
fi

if [[ $novnc == "TRUE" ]]
then
	######
	# Installation accès vnc via navigateur
	######
	sudo apt-get install -y novnc
	sudo apt-get install -y git

	cd /home/$USER
	#
	#test si le dossier noVNC existe, si oui suppression
	#
	if [ -d "/home/${USER}/noVNC" ]
	  then
	  echo "suppression de l'ancien dossier noVNC"
	  rm -Rf /home/$USER/noVNC
	fi

	git clone git://github.com/kanaka/noVNC

	if [ -f /etc/systemd/system/novnc.service ]
	  then
	  sudo systemctl stop novnc.service
	  sudo systemctl disable novnc.service
	  sudo rm /etc/systemd/system/novnc.service
	fi

	cat $dirinstall/novnc.service | sed -e "s/MOI/${USER}/g" > /tmp/novnc.service
	sudo cp /tmp/novnc.service /etc/systemd/system/novnc.service
	sudo chmod 644 /etc/systemd/system/novnc.service

	sudo systemctl daemon-reload
	sudo systemctl enable novnc.service
	sudo systemctl start novnc.service
fi

