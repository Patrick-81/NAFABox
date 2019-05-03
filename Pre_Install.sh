################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On Sept 02 2018
# V0.1
################################################
#!/bin/bash -i

sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo apt-get update
sudo apt-get -y install figlet dialog yad xterm lshw
sudo apt-get -y install appmenu-gtk2-module appmenu-gtk3-module
chmod +x ./Install.sh
cd ./ConfigTinker
mkdir -p ~/bin
#source ./pwd_ConfigTinker.sh
if [[ -z "$nafabox_path" ]]
then
	echo "export nafabox_path=`pwd`"  >> ~/.bashrc
	echo -e "nafabox_path was added"
fi
chmod +x ./*

echo "Please Reload Terminal and Run Install.sh"

