################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# On November 27 2018
# V0.1
################################################
#!/bin/bash -i

if [ -d "/usr/lib/armbian-config/" ]
then
    echo "armbian-config is already install"
	sudo armbian-config
elif [ -d "/home/$USER/bin/armbian-config/" ]
then
	cd /home/$USER/bin/armbian-config/
    git pull
    echo "Armbian-config is already install in /home/$USER/armbian-config/"
	sudo debian-config
else
    echo "Install Armbian-config in /home/$USER/armbian-config/"
	cd /home/$USER/bin/
	sudo apt-get -y install git iperf3 psmisc curl bc expect dialog network-manager sunxi-tools iptables debconf-utils unzip dirmngr software-properties-common 
	git clone https://github.com/armbian/config.git armbian-config
	cd /home/$USER/bin/armbian-config/
	sudo bash debian-config
fi
