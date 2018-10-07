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
dirinstall=$nafabox_path

figlet -k Install BrowsePy
echo "================================================="
echo "================================================="
cd $dirinstall
# s'assurer que que pip est installe
sudo apt-get install python-pip python3-pip
# installer browsepy
pip install browsepy
# Lancer le serveur au demarrage
# placer la commande sous .config/autostart
cat $dirinstall/browsepy.desktop | sed -e "s#MOI#${HOME}#g" > /tmp/browsepy.desktop

cp /tmp/browsepy.desktop $HOME/.config/autostart/.
# fin


