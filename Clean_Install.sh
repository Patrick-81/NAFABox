################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On Sept 02 2018
# V0.1
################################################
#!/bin/bash -i

server_choice=$1

if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
else

	echo "############################"
        echo "##   Clean Installation   ##"
        echo "############################" 
	
	sudo apt-get -y purge caffeine mc mc-data geany gnome-builder meld codium gimp pinta thunderbird putty* celluloid kazam terminator *xterm* filezilla* hexchat libreoffice* 
	sudo apt-get -y autoremove
	
	sudo rm -i /etc/apt/sources.list.d/archive_uri-http_paulcarroty_gitlab_io_vscodium-deb-rpm-repo_debs_-jammy.list 
	sudo rm -i /etc/apt/sources.list.d/saiarcot895-ubuntu-chromium-dev-jammy.list 
	
	sudo apt-get update

fi
