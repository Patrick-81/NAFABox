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
# Recherche du répertoire ConfigTinker
######
dirinstall=$(head -n 1 temp_directory.tmp)
######
dest="/usr/share/kstars/ekos/mount/qml/"
sudo mv $dest/mountbox.qml $dest/mountbox.qml.old
cp $dirinstall/pad.tar.gz /tmp
sudo tar xvzf $dirinstall/pad.tar.gz -C $dest
 

