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
if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=$nafabox_path
######

figlet -k Install PAD
echo "================================================="
echo "================================================="

dest="/usr/share/kstars/ekos/mount/qml"
sudo mv $dest/mountbox.qml $dest/mountbox.qml.old
cp $dirinstall/pad.tar.gz /tmp
sudo tar xvzf $dirinstall/pad.tar.gz -C $dest/
 

