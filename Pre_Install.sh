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


dialog --title " Install French config" --clear \
       --yesno "Do you need install French ?" 10 30

case $? in
    0)	echo "Install French"
        figlet -k Install FRENCH
	    echo "================================================="
	    echo "================================================="
	    # passer le systeme en français
	    # ajout des packs langage
	    sudo apt-get -y install language-pack-fr language-pack-gnome-fr
        sudo apt-get -y install language-pack-fr language-pack-gnome-fr-base
        sudo apt-get -y install wfrench chromium-browser-l10n
	    sudo locale-gen fr_FR fr_FR.UTF-8
	    sudo update-locale LC_ALL=fr_FR.UTF-8 LANG=fr_FR.UTF-8
	    sudo dpkg-reconfigure keyboard-configuration
        ;;
    1)	
        echo "Language not change"
        ;;
    255)	
        echo "exit"
        ;;
esac

echo "Please Reload Terminal and Run Install.sh"

