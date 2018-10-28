################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# On October 2018
# V0.1
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

figlet -k Install BrowsePy
echo "================================================="
echo "================================================="
cd $dirinstall
# s'assurer que que pip est installe
sudo apt-get -y install python-pip python3-pip python-setuptools python3-setuptools
# installer browsepy
sudo pip install browsepy
# Lancer le serveur au demarrage
# placer la commande sous .config/autostart
cat $dirinstall/browsepy.desktop | sed -e "s#MOI#${HOME}#g" > /tmp/browsepy.desktop

sudo cp /tmp/browsepy.desktop $HOME/.config/autostart/.
# fin


