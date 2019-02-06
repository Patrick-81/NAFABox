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

server_choice=$1

######
# Statut d'installation
# Installation status
######
#touch $dirinstall/install-status.txt
######
# option for apt
######
options="--auto-remove --yes -q"
######
# Install mate
######
#if [[ -z $(cat $dirinstall/install-status.txt | grep mate) ]]
#then
$dirinstall/install_base.sh $server_choice

figlet -k Install Configuration
echo "================================================="
echo "================================================="
#	echo mate >> $dirinstall/install-status.txt
#fi
######
# pré-requis
# pre requisite
######
#if [[ -z $(cat install-status.txt | grep prereq) ]]
#then

sudo apt-get $options install libpangox-1.0-0 libespeak1 libpango1.0-0
sudo apt-get $options install libsonic0 espeak-data fonts-freefont-ttf
version=`lsb_release -c -s`
if [[ $version == "xenial" ]]
then
	sudo apt-get $options install ttf-freefont 
fi
sudo apt-get $options install libjpeg62 libglu1
sudo apt-get $options install xplanet espeak openssh-server uuid
#	echo prereq >> $dirinstall/install-status.txt
#fi
######
# Installer les utilitaires
# Install utilities
######
mkdir -p ~/bin

# Modificateur de résolution
# Resolution modifier
$dirinstall/install_setres.sh | tee -a "$dirinstall/nafabox.log"


######
# Install conf updater
######
if [[ $server_choice == "server" ]]
then
	echo "no icon for server"
else
	figlet -k Install Conf Updater
	echo "================================================="
	echo "================================================="

	cp $dirinstall/update_conf.sh ~/bin/.
	chmod +x ~/bin/update_conf.sh
	sudo ln -sf ~/bin/update_conf.sh /usr/bin/update_conf
	sudo cp /usr/share/icons/gnome/32x32/apps/system-software-update.png /usr/share/pixmaps/update_conf.png
	# Création du raccourci pour update_conf
	$dirinstall/install_shortcut.sh update_conf "bash -ic update_conf"
fi

######
# Création du raccourci pour install_index.sh
######
if [[ $server_choice == "server" ]]
then
	echo "no icon for server"
else
	figlet -k Install Index program
	echo "================================================="
	echo "================================================="

	cp $dirinstall/install_index.sh ~/bin/install_index.sh
	sudo ln -sf ~/bin/install_index.sh /usr/bin/install_index
	sudo cp $dirinstall/install_index.png /usr/share/pixmaps/install_index.png
	sudo cp $dirinstall/index.txt ~/bin/index.txt
	$dirinstall/install_shortcut.sh install_index "bash -ic install_index"
fi

######
# Création du raccourci pour install_hotspot.sh
######
figlet -k Install hotspot program
echo "================================================="
echo "================================================="

if [ -d "/usr/lib/armbian-config/" ]
then
    echo "armbian-config is already install"
else
    cp $dirinstall/run_armbian_config.sh ~/bin/run_armbian_config.sh
    sudo ln -sf ~/bin/run_armbian_config.sh /usr/bin/armbian-config

    if [[ $server_choice == "server" ]]
    then
        echo "no icon for server"
    else
        sudo cp $dirinstall/install_hotspot.png /usr/share/pixmaps/install_hotspot.png
        $dirinstall/install_shortcut.sh armbian-config "bash -ic armbian-config"
    fi
fi

##### 
# Création du raccourci pour switch_language.sh
######
if [[ $server_choice == "server" ]]
then
	echo "no icon for server"
else
	figlet -k Install switch language program
	echo "================================================="
	echo "================================================="

	cp $dirinstall/switch_language.sh ~/bin/switch_language.sh
	sudo ln -sf ~/bin/switch_language.sh /usr/bin/switch_language
	sudo cp /usr/share/icons/gnome/48x48/apps/config-language.png /usr/share/pixmaps/switch_language.png
	$dirinstall/install_shortcut.sh switch_language "bash -ic switch_language"
fi

##### 
# Création du raccourci pour setup_time.sh
######
if [[ $server_choice == "server" ]]
then
	echo "no icon for server"
else

	$dirinstall/install_setup-time.sh | tee -a "$dirinstall/nafabox.log"
fi

##### 
# Création du programme d'upadet des scripts
######
if [[ $server_choice == "server" ]]
then
	echo "no icon for server"
else
	figlet -k Install Script updater program
	echo "================================================="
	echo "================================================="
	cp $dirinstall/update_nafabox_script.sh ~/bin/update_nafabox_script.sh
	sudo ln -sf ~/bin/update_nafabox_script.sh /usr/bin/update_nafabox_script
	sudo cp /usr/share/icons/gnome/48x48/apps/system-software-update.png /usr/share/pixmaps/update_nafabox_script.png
	$dirinstall/install_shortcut.sh update_nafabox_script "bash -ic update_nafabox_script"
fi

######
# Install/Update conf
######

figlet -k Install Configuration
echo "================================================="
echo "================================================="
~/bin/update_conf.sh initial $server_choice
