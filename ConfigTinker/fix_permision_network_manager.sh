################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
#
# Modified: 
#
# On October 29 2017
# V0.1
################################################
#!/bin/bash -i
######

######
# Installation du policykit manquant
######

dir=/etc/polkit-1/localauthority/50-local.d/  #mettre le chemin de polkit local

echo -e '[nm-applet]\nIdentity=unix-group:netdev;unix-group:sudo\nAction=org.freedesktop.NetworkManager.*\nResultAny=yes\nResultInactive=no\nResultActive=yes\n' >> /tmp/org.freedesktop.NetworkManager.pkla


sudo cp /tmp/org.freedesktop.NetworkManager.pkla ${dir}
sudo rm /tmp/org.freedesktop.NetworkManager.pkla
sudo adduser ${USER} sudo
sudo adduser ${USER} netdev
