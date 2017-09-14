################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
# script appelé par install_kstars.sh
################################################
#!/bin/bash
#
dirinstall=$(find ~ -name ConfigTinker)
#
################################
# installation du pad amélioré #
################################
#
dest="/usr/share/kstars/ekos/mount/qml/"
sudo mv $dest/mountbox.qml $dest/mountbox.qml.old
cp $dirinstall/annexe/pad.tar.gz /tmp
sudo tar xvzf $dirinstall/annexe/pad.tar.gz -C $dest
#
#################
# fin de script #
#################
#
exit
