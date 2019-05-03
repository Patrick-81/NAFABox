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
if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=${nafabox_path}
server_choice=$1

figlet -k Install ComSetup
echo "================================================="
echo "================================================="
echo " Install time zone, Web Interface, X11VNC, WebDavServer, BrowsePy and NoVNC"
echo "================================================="
echo "================================================="

cd ${dirinstall}
######
# detect language
######
source ${dirinstall}/detect_language.sh
source ${dirinstall}/proctype.sh


sudo apt-get update
if [[ ${server_choice} == "server" ]]
then
    echo "############################"
    echo "## install in server mode ##"
    echo "############################"
	time_z=TRUE
	web=TRUE
	xvnc=FALSE
	dav=TRUE
	browse=TRUE
	novnc=FALSE
	awake=FALSE
    nomach=FALSE
    ddserv=TRUE
elif [[ ${server_choice} == "default" ]]
then
    echo "#############################"
    echo "## install in default mode ##"
    echo "#############################"
	time_z=TRUE
	web=TRUE
	xvnc=TRUE
	dav=TRUE
	browse=TRUE
	novnc=TRUE
	awake=TRUE
    nomach=TRUE
    ddserv=TRUE    
    
else
	if ${french}
	then
		dial[0]="Installation/Mise à jour des logiciels"
		dial[1]="Choisir le(s) logiciel(s) à installer"
		choice[0]="Définir time zone"
		choice[1]="Installation Interface HTML"
		choice[2]="Installation X11VNC"
		choice[3]="Install WebDav"
		choice[4]="Installation BrowsePy"
		choice[5]="Installation NoVNC"
        choice[6]="Installation Nomachine"
		choice[7]="HotspotAwake Script"
        choice[8]="Serveur pour QDslrDashboard"

	else
		dial[0]="Install/Update of software"
		dial[1]="Choose software(s) to install"
		choice[0]="define time zone"
		choice[1]="Install HTML Interface"
		choice[2]="Install X11VNC"
		choice[3]="Install WebDav"
		choice[4]="Install BrowsePy"
		choice[5]="Install NoVNC"
        choice[6]="Install Nomachine"
		choice[7]="HotspotAwake Script"
        choice[8]="Server for QDslrDashboard"

	fi

	st=(true true true true true true true false true)

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
		--field="${choice[6]}:CHK" \
        --field="${choice[7]}:CHK" \
        --field="${choice[8]}:CHK" \
		"" "${st[0]}" "${st[1]}" "${st[2]}" \
		"${st[3]}" "${st[4]}" "${st[5]}" "${st[6]}" \
        "${st[7]}" "${st[8]}"`
	then
		time_z=$(echo "$chose" | cut -d "|" -f2)
		web=$(echo "$chose" | cut -d "|" -f3)
		xvnc=$(echo "$chose" | cut -d "|" -f4)
		dav=$(echo "$chose" | cut -d "|" -f5)
		browse=$(echo "$chose" | cut -d "|" -f6)
		novnc=$(echo "$chose" | cut -d "|" -f7)
        nomach=$(echo "$chose" | cut -d "|" -f8)
		awake=$(echo "$chose" | cut -d "|" -f9)
        ddserv=$(echo "$chose" | cut -d "|" -f10)
	else
		echo "cancel"
	fi
fi

if [[ ${time_z} == "TRUE" ]]
then
	######
	# Définir time zone
	######
	sudo dpkg-reconfigure tzdata
fi

if [[ ${web} == "TRUE" ]]
then
	######
	# Installer nginx
	######
	sudo apt-get -y install nginx apache2
	######
	# Installer php
	######
	sudo apt-get -y install php
	######
	# Creer le répertoire www
	######
	site=/home/${USER}/www
	mkdir -p /home/${USER}/www
	######
	# Installer les fichiers nécessaires pour la mise à l'heure
	# en remote
	######
	# le fichier html d'accès au site
	if ${french}
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
	cat ${dirinstall}/index.html | sed -e "s/ACTUATE/${dial[0]}/g" > ${site}/index.html
	sudo systemctl stop nginx.service
	sudo systemctl disable nginx.service
	sudo cp ${dirinstall}/setdate.php ${site}/setdate.php
	sudo cp ${dirinstall}/shutdown_reboot.php ${site}/shutdown_reboot.php
	sudo chown www-data:www-data ${site}/setdate.php
	sudo chown www-data:www-data ${site}/shutdown_reboot.php

	# move apache at port 8280
	cat /etc/apache2/ports.conf | sed -e "s/Listen 80/Listen 8280/g" > /tmp/ports.conf
	sudo mv /tmp/ports.conf /etc/apache2/ports.conf
	cat /etc/apache2/sites-enabled/000-default.conf | sed -e "s=*:80=*:8280=g" > /tmp/000-default.conf
	sudo mv /tmp/000-default.conf /etc/apache2/sites-enabled/000-default.conf
	sudo service apache2 restart


	sudo systemctl enable nginx.service
	sudo systemctl start nginx.service

	cat sudoers.txt | sed -e "s/MOI/${USER}/g" > /tmp/sudoers
	sudo cp /tmp/sudoers /etc/sudoers.d/perm${USER}
	echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
	echo "${dial[3]}"
	echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

	######
	# Installation du serveur nginx
	######
	# mod 22/11/2018
	sudo apt-get install -y --reinstall php-fpm
    #
	sudo apt-get install -y --reinstall nginx
	sudo apt-get -y install php-fpm
	sudo rm /etc/nginx/sites-available/default
	sudo rm /etc/nginx/sites-enabled/default
	cat ${dirinstall}/server.txt | sed -e "s/MOI/${USER}/g" > /tmp/site-temp
    if [[ -S "/var/run/php/php7.0-fpm.sock" ]]
    then
        cat /tmp/site-temp | sed -e "s/VER-PHP/7.0/g" > /tmp/site-${USER}
    elif  [[ -S "/var/run/php/php7.1-fpm.sock" ]]
    then
        cat /tmp/site-temp | sed -e "s/VER-PHP/7.1/g" > /tmp/site-${USER}
    elif  [[ -S "/var/run/php/php7.2-fpm.sock" ]]
    then
        cat /tmp/site-temp | sed -e "s/VER-PHP/7.2/g" > /tmp/site-${USER}
    elif  [[ -S "/var/run/php/php7.3-fpm.sock" ]]
    then
        cat /tmp/site-temp | sed -e "s/VER-PHP/7.3/g" > /tmp/site-${USER}
    fi
	sudo cp /tmp/site-${USER} /etc/nginx/sites-available/site-${USER}
	sudo chown ${USER}:${USER} /etc/nginx/sites-available/site-${USER}
	sudo ln -sf /etc/nginx/sites-available/site-${USER} /etc/nginx/sites-enabled/site-${USER}

fi

if [[ ${awake} == "TRUE" ]]
then
	######
	# Pour les machines pour lesquelles le hanshake se passe mal
	######
	cat ${dirinstall}/hotspotawake.service | sed -e "s/MOI/${USER}/g" > /tmp/hotspotawake.service
	sudo cp /tmp/hotspotawake.service /lib/systemd/system/hotspotawake.service
	chmod +x ${dirinstall}/hotspotawake.sh
	cp ${dirinstall}/hotspotawake.sh ~/bin/
	sudo systemctl stop hotspotawake.service
	sudo systemctl disable hotspotawake.service
	sudo systemctl daemon-reload
	sudo systemctl enable hotspotawake.service
	sudo systemctl start hotspotawake.service
	######
fi



if [[ ${dav} == "TRUE" ]]
then
	######
	# Install of webdav server
	######
	${dirinstall}/install_webdavserver.sh
fi

if [[ ${browse} == "TRUE" ]]
then
	######
	# Install of browsepy
	######
	${dirinstall}/install_browsepy.sh
fi

if [[ ${nomach} == "TRUE" ]]
then
	######
	# Install of nomachine server
	######
	${dirinstall}/install_nomachine.sh
fi

if [[ ${xvnc} == "TRUE" ]]
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
    vnc_path=/home/${USER}/.vnc/passwd
    rm ${vnc_path}
    test_w=true
    while ${test_w}
    do
        echo "Enter Le mot de passe VNC pour votre BOX :"
        x11vnc -storepasswd
        if [[ -f ${vnc_path} ]]
        then
            test_w=false
        else
            echo "Reload"
        fi
    done
	echo "Merci ! ----------------------------------"

	machine=$(sudo lshw | grep "produit\|product" | grep "Raspberry")
	normal_option="-auth guess -forever -loop -noncache -noxdamage -noxrecord -repeat -shared -xkb -rfbauth $vnc_path -rfbport 5900"
	tinker_option="-forever -loop -noncache -noxdamage -noxrecord -repeat -shared -xkb -rfbauth $vnc_path -rfbport 5900"

 	#test version
	if [[ ${proc} == "_amd64" ]]
	then
		option=${normal_option}
	elif [[ ${proc} == "_armhf" ]]
	then
		if [[ ${machine} == *"Raspberry"* ]]
		then 
			option=${normal_option}
		else
			option=${tinker_option}
		fi
	elif [[ ${proc} == "_x86" ]]
	then
		option=${normal_option}
	elif [[ ${proc} == "_aarch64" ]]
	then
		option=${tinker_option}
	fi

	# injection fichier system
	cat ${dirinstall}/x11vnc.service | sed -e "s=OPTION=$option=g" > /tmp/x11vnc.service
	sudo mv /tmp/x11vnc.service /lib/systemd/system/x11vnc.service
	# allumage au démarage
	sudo systemctl daemon-reload
	sudo systemctl enable x11vnc.service
	echo "Need reboot for active VNC"
fi

if [[ ${novnc} == "TRUE" ]]
then
	######
	# Installation accès vnc via navigateur
	######
	sudo apt-get -y install novnc
	sudo apt-get -y install git

	cd /home/${USER}/bin/
	#
	#test si le dossier noVNC existe, si oui suppression
	#
	if [[ -d "/home/${USER}/bin/noVNC" ]]
	then
	  echo "suppression de l'ancien dossier noVNC"
	  rm -Rf /home/${USER}/bin/noVNC
	fi

	git clone git://github.com/kanaka/noVNC

	if [[ -f /etc/systemd/system/novnc.service ]]
	  then
	  sudo systemctl stop novnc.service
	  sudo systemctl disable novnc.service
	  sudo rm /etc/systemd/system/novnc.service
	fi

	cat ${dirinstall}/novnc.service | sed -e "s=MOI=${USER}=g" > /tmp/novnc.service
	sudo cp /tmp/novnc.service /etc/systemd/system/novnc.service
	sudo chmod 644 /etc/systemd/system/novnc.service

	sudo systemctl daemon-reload
	sudo systemctl enable novnc.service
	sudo systemctl start novnc.service
fi

if [[ ${ddserv} == "TRUE" ]]
then
	######
	# Installation du ddserver pour qdslrdashboard
	######

    cd ~/bin
    if [[ -d "/home/${USER}/bin/DslrDashboardServer" ]]
	  then
	  echo "suppression de l'ancien dossier ddserver"
	  rm -Rf /home/${USER}/bin/DslrDashboardServer
	fi
    git clone git://github.com/hubaiz/DslrDashboardServer
    sudo apt-get -y install build-essential pkg-config libusb-1.0-0-dev
    cd ~/bin/DslrDashboardServer
    g++ -Wall src/main.cpp src/communicator.cpp `pkg-config --libs --cflags libusb-1.0` -lpthread -lrt -lstdc++ -o ddserver
    sudo ln -sf ~/bin/DslrDashboardServer/ddserver /usr/bin/ddserver

	cat ${dirinstall}/ddserver.service | sed -e "s/MOI/${USER}/g" > /tmp/ddserver.service
	sudo cp /tmp/ddserver.service /lib/systemd/system/ddserver.service
	sudo systemctl stop ddserver.service
	sudo systemctl disable ddserver.service
	sudo systemctl daemon-reload
	sudo systemctl enable ddserver.service
	sudo systemctl start ddserver.service

fi
