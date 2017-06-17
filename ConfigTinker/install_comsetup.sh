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
# recupere le user
######
moi=$(whoami)
data=$(pwd)
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
# Installation x11vnc
######
sudo apt install -y x11vnc
# sudo x11vnc -storepasswd "12345678" /root/.vncpasswd
sudo cp $data/x11vnc.service /etc/systemd/system/x11vnc.service
######
# Installation accès vnc via navigateur
######
sudo apt-get install -y novnc
cd /home/$moi
git clone git://github.com/kanaka/noVNC
cat $data/novnc.service | sed -e "s/MOI/${moi}/g" > /tmp/novnc.service
sudo cp /tmp/novnc.service /etc/systemd/system/novnc.service
sudo systemctl stop x11vnc.service
sudo systemctl stop novnc.service
sudo systemctl disable x11vnc.service
sudo systemctl disable novnc.service
sudo systemctl daemon-reload
sudo systemctl enable x11vnc.service
sudo systemctl enable novnc.service
sudo systemctl start x11vnc.service
sudo systemctl start novnc.service


