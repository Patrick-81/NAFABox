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

if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
else
	sudo apt-get update
	figlet -k NAFABox
	echo "================================================="
	echo "================================================="
	if [[ $server_choice == "server" ]]
	then
        echo "############################"
        echo "## install in server mode ##"
        echo "############################"
		$nafabox_path/install_conf.sh server | tee -a "$nafabox_path/nafabox.log"
	else

		$nafabox_path/install_conf.sh | tee -a "$nafabox_path/nafabox.log"
	fi
fi
