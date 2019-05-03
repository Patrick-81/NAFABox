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

figlet -k Install SetRes
echo "================================================="
echo "================================================="

######
source ${dirinstall}/detect_language.sh
if test -d Desktop
then
	desktop="Desktop"
else
	desktop="Bureau"
fi
sudo apt-get -y install python-tk python-imaging-tk python3-tk
cp ${dirinstall}/setres.py ~/bin/.
cp ${dirinstall}/resol.scr ~/.config/.
chmod +x ${dirinstall}/resol.scr
cp ${dirinstall}/resol.scr.desktop ~/.config/autostart/.
chmod +x ~/bin/setres.py
sudo cp /usr/share/icons/gnome/48x48/apps/preferences-desktop-display.png /usr/share/pixmaps/setres.png
sudo ln -sf ~/bin/setres.py /usr/bin/setres
${dirinstall}/install_shortcut.sh setres

