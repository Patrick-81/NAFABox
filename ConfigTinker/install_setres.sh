################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#!/bin/bash
source detect_language.sh
if test -d Desktop
then
	desktop="Desktop"
else
	desktop="Bureau"
fi
if [ -f ~/bin/setres.sh ] && [ -f ~/$desktop/$AppName.desktop ] && [ -f /usr/share/pixmaps/setres.png ]
then
	if $french
	then
		echo "setres déjà installé"
	else
		echo "setres yet installed"
	fi
else
	sudo apt-get -y install python-tk python-imaging-tk python3-tk
	cp $(pwd)/setres.py ~/bin/.
	chmod +x ~/bin/setres.py
	sudo cp /usr/share/icons/gnome/48x48/apps/preferences-desktop-display.png /usr/share/pixmaps/setres.png
	sudo ln -sf ~/bin/setres.py /usr/bin/setres
	$(pwd)/install_shortcut.sh setres
fi

