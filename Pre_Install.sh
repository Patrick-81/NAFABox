################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On Sept 02 2018
# V0.1
################################################
#!/bin/bash -i

# install yad figlet dialog
sudo apt-get update
sudo apt-get -y install appmenu-gtk2-module appmenu-gtk3-module
sudo apt-get -y install figlet dialog yad lshw

chmod +x ./Install.sh
cd ./ConfigTinker
mkdir -p ~/bin

# add ConfigTinker Path
#source ./pwd_ConfigTinker.sh
if [[ -z "$nafabox_path" ]]
then
	echo "export nafabox_path=`pwd`"  >> ~/.bashrc
	echo -e "nafabox_path was added"
fi
chmod +x ./*

# install French ?
dialog --title " Install French config" --clear \
       --yesno "Do you need install French ?" 10 30

case $? in
    0)
      echo "Install French"
      figlet -k Install FRENCH
	    echo "================================================="
	    echo "================================================="
	    # passer le systeme en français
	    # ajout des packs langage
	    sudo locale-gen fr_FR fr_FR.UTF-8
	    sudo update-locale LC_ALL=fr_FR.UTF-8 LANG=fr_FR.UTF-8
	    sudo dpkg-reconfigure keyboard-configuration
	    sudo apt-get -y install language-pack-fr
      sudo apt-get -y install language-pack-gnome-fr
      sudo apt-get -y install wfrench
      sudo apt-get -y chromium-browser-l10n
      ;;
    1)	
      echo "Language not change"
      ;;
    255)	
      echo "exit"
      ;;
esac

echo "Please Reboot and Run Install.sh after reboot"

