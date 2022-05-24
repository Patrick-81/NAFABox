################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
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

figlet -k Install Serveur WebDav
echo "================================================="
echo "================================================="

######
# detect language
######
source ${dirinstall}/detect_language.sh
######
# Installation du serveur webdav
######
# Extras nginx
sudo apt-get -y install nginx-full
# copy of the server file
cat ${dirinstall}/webdav-server.txt | sed -e "s/MOI/${USER}/g" > /tmp/site-webdav_tmp
sudo cp /tmp/site-webdav_tmp /etc/nginx/sites-available/site-webdav
sudo chown ${USER}:${USER} /etc/nginx/sites-available/site-webdav
sudo ln -sf /etc/nginx/sites-available/site-webdav /etc/nginx/sites-enabled/site-webdav

# move apache at port 8280
cat /etc/apache2/ports.conf | sed -e "s/Listen 80/Listen 8280/g" > /tmp/ports.conf
sudo mv /tmp/ports.conf /etc/apache2/ports.conf
cat /etc/apache2/sites-enabled/000-default.conf | sed -e "s=*:80=*:8280=g" > /tmp/000-default.conf
sudo mv /tmp/000-default.conf /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart

# Restart nginx
sudo service nginx stop
sleep 2
sudo service nginx start




