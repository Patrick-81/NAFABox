################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#!/bin/bash
dest="/usr/share/kstars/ekos/mount/qml/"
sudo mv $dest/mountbox.qml $dest/mountbox.qml.old
cp $(pwd)/pad.zip /tmp
sudo tar xvzf $(pwd)/pad.tar.gz -C $dest
 

