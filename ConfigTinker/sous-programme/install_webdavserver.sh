################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
# script appelé par install_comsetup.sh
################################################
#!/bin/bash
#
dirinstall=$(find ~ -name ConfigTinker)
moi=$(whoami)
data=$dirinstall
#
##################################
# Installation du serveur webdav #
##################################
#
sudo apt -y install nginx-extras
#
# copy of the server file
#
cat $data/annexe/webdav-server.txt | sed -e "s/MOI/${moi}/g" > /tmp/site-webdav
sudo cp /tmp/site-webdav /etc/nginx/sites-available/.
sudo chown $moi:$moi /etc/nginx/sites-available/site-webdav
sudo ln -sf /etc/nginx/sites-available/site-webdav /etc/nginx/sites-enabled/site-webdav
#
# Restart nginx
sudo service nginx stop
sleep 2
sudo service nginx start
#
#################
# fin de script #
#################
#
exit
