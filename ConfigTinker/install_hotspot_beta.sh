################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# On November 27 2018
# V0.1
################################################
#!/bin/bash -i
# check for root priveleges
#
#if [[ $EUID != 0 ]]; then
#	echo "This tool requires root privileges. Try again with \"sudo \" please ..." >&2
#	sleep 2
#	exit 1
#fi

if [ -d "/usr/lib/armbian-config/" ]
then
    set -a
	source /usr/lib/armbian-config/functions-network.sh
	source /usr/lib/armbian-config/functions.sh
	source /usr/lib/armbian-config/jobs.sh
	source /usr/lib/armbian-config/submenu.sh
	sudo submenu_networking
    set +a
elif [ -d "/home/$USER/armbian-config/" ]
then
    set -a
	source /home/$USER/armbian-config/debian-config-functions-network
	source /home/$USER/armbian-config/debian-config-functions
	source /home/$USER/armbian-config/debian-config-jobs
	source /home/$USER/armbian-config/debian-config-submenu
	sudo submenu_networking
    set +a
else
	mkdir -p /home/$USER/bin
	cd /home/$USER/bin

	sudo apt-get -y install git iperf3 psmisc curl bc expect dialog network-manager sunxi-tools iptables debconf-utils unzip dirmngr software-properties-common

	git clone https://github.com/armbian/config.git armbian-config
    set -a
	source /home/$USER/armbian-config/debian-config-functions-network
	source /home/$USER/armbian-config/debian-config-functions
	source /home/$USER/armbian-config/debian-config-jobs
	source /home/$USER/armbian-config/debian-config-submenu
    sudo submenu_networking
    set +a
fi
