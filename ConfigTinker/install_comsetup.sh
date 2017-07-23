################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
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
installed=$(apt -qq list nginx)
if test -z "$installed"
then
	sudo apt-get -y install nginx
fi
######
# Installer php
######
installed=$(apt -qq list php)
if test -z "$installed"
then
	sudo apt-get -y install php
fi
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
	dial[0]="Mettre à l'heure"
	dial[1]="Actualiser l'affichage de l'heure"
	dial[2]="Date actualisée a"
	dial[3]="Pour la mise a l'heure se connecter sur le boitier
avec l'adresse IP de ce dernier qui differe selon qu'il
est soit en reseau domestique soit en mode point d'acces."
else
	dial[0]="Set time and date"
	dial[1]="Update time and date"
	dial[2]="Date and time updated to"
	dial[3]="To update remote date do connect to the box with its
IP adress which is different if it is on home network or access point"
fi
echo "<form action=\"/setdate.php\" method=\"post\">
  <div>
    <input name=\"date\" id=\"date\" value=\"\">
  </div>
  <script type=\"text/javascript\">
	var a = update();
    function update() {
      var d = new Date();
      var utc=d.toString();
      console.log(utc)
      document.getElementById(\"date\").value = utc;
    }
 </script>
 <div>
    <button>"${dial[0]}"</button>
  </div>
</form>
<form action="">
  <div>
	<button onclick=\"update()\">"${dial[1]}"</button>
  </div>
</form>" > $site/index.html

# le fichier de mise à l'heure
echo "<?php 
   \$date  = \$_POST['date'];
   \$command=\"sudo date -s \\\"{\$date}\\\"\";
   shell_exec(\$command);
   echo \"${dial[2]}\".\$date;
?>" > $site/setdate.php
sudo chown www-data:www-data $site/setdate.php
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
cat $data/sudoers.txt | sed -e "s/MOI/${moi}/g" > /tmp/sudoers
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
<<<<<<< HEAD
sudo $data/install_webdavserver.sh
=======
$data/install_webdavServer.sh
>>>>>>> 47761d8ecdd0c54946cdc3bd12f900dfeb100e5f
######
# Installation x11vnc
######
sudo apt -y install x11vnc
mkdir -p ~/.x11vnc
cp $dirinstall/startx11vnc.sh ~/bin/.
chmod +x ~/bin/startx11vnc.sh
~/bin/startx11vnc.sh
cp $dirinstall/startx11vnc.desktop ~/.config/autostart/.
#sudo cp $data/x11vnc.service /etc/systemd/system/x11vnc.service
######
# Installation accès vnc via navigateur
######
sudo apt-get install -y novnc
cd /home/$moi
git clone git://github.com/kanaka/noVNC
cat $data/novnc.service | sed -e "s/MOI/${moi}/g" > /tmp/novnc.service
sudo cp /tmp/novnc.service /etc/systemd/system/novnc.service
sudo systemctl daemon-reload
#sudo systemctl stop x11vnc.service
#sudo systemctl disable x11vnc.service
#sudo systemctl enable x11vnc.service
#sudo systemctl start x11vnc.service
sudo systemctl stop novnc.service
sudo systemctl disable novnc.service
sudo systemctl enable novnc.service
sudo systemctl start novnc.service


