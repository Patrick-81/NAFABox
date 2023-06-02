################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On May 28 2023
# V0.1
################################################
#!/bin/bash -i


# install Xubuntu
sudo apt-get -y install xubuntu-desktop gdm3

#install Xubuntu plugin and extension
sudo apt-get -y install xfce4-cpufreq-plugin xfce4-appmenu-plugin xfce4 desktop-base tango-icon-theme pavucontrol pulseaudio xfce4-whiskermenu-plugin xfce4-terminal xfce4-taskmanager xfce4-systemload-plugin xfce4-sntray-plugin xfce4-sensors-plugin xsensors lm-sensors xfce4-screenshooter xfce4-screensaver xfce4-power-manager xfce4-power-manager-plugins xfce4-netload-plugin xfce4-mount-plugin xfce4-indicator-plugin gir1.2-notify-0.7 at-spi2-core

#install networkmanger
sudo apt-get -y install network-manager-gnome network-manager-ssh-gnome ifupdown

#install application
sudo apt-get -y install git pluma gnome-disk-utility language-pack-gnome-fr file-roller evince shotwell eog gvfs gnome-calculator firefox

#install login manager
sudo apt-get -y install policykit-1 policykit-desktop-privileges policykit-1-gnome

#install thunar extension
sudo apt-get -y install thunar-archive-plugin thunar-gtkhash 

#install bluetooth support
sudo apt-get -y install blueman bluez-meshd bluez-tools bluez-alsa-utils bluez-obexd bluez-tests
sudo apt-get -y install pulseaudio-module-bluetooth pulseaudio-module-jack 
sudo apt-get -y install gnome-bluetooth indicator-bluetooth 
