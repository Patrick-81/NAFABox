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
dirinstall=$nafabox_path

figlet -k Install Serveur WebDav
echo "================================================="
echo "================================================="

######
# detect language
######
source $dirinstall/detect_language.sh
######
# Installation du serveur webdav
######
# Extras nginx
sudo apt-get -y install nginx-extras
# copy of the server file
cat $dirinstall/webdav-server.txt | sed -e "s/MOI/${USER}/g" > /tmp/site-webdav
sudo cp /tmp/site-webdav /etc/nginx/sites-available/.
sudo chown $USER:$USER /etc/nginx/sites-available/site-webdav
sudo ln -sf /etc/nginx/sites-available/site-webdav /etc/nginx/sites-enabled/site-webdav
# Restart nginx
sudo service nginx stop
sleep 2
sudo service nginx start




