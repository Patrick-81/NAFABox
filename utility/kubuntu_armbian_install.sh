################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On May 28 2023
# V0.1
################################################
#!/bin/bash -i


# install Kubuntu with sddm
sudo apt-get -y install kubuntu-desktop plasma-desktop sddm kde-standard kde-plasma-desktop kwin-x11 kwin-addons kscreen
# install discover plastform 
sudo apt-get -y install plasma-discover* fwupd
# install kde tools
sudo apt-get -y plasma-disks plasma-nm kde-config-screenloker kde-config-sddm kde-config-plymouth kde-cli* plasma-integration kde-config-systemd kde-config-updates kdeplasma-addons-data plasma-wokspace plymouth-theme-kubuntu-logo plasma-pa plymouth-theme-kubuntu-text powerdevil systemsettings kubuntu-settings-desktop plasma-systemmonitor
#install breeze theme
sudo apt-get -y kwin-style-breeze breeze breeze-icon-theme breeze-cursor-theme

#install networkmanger
sudo apt-get -y install network-manager-gnome network-manager-ssh-gnome ifupdown

#install application
sudo apt-get -y install git pluma gnome-disk-utility language-pack-gnome-fr file-roller evince shotwell eog gvfs gnome-calculator firefox hostapd

#install login manager
sudo apt-get -y install policykit-1 policykit-desktop-privileges policykit-1-gnome

#install dolphin extension
sudo apt-get -y install dolphin dolphin-plugins

#install bluetooth support
sudo apt-get -y install blueman bluez-meshd bluez-tools bluez-alsa-utils bluez-obexd bluez-tests
sudo apt-get -y install pulseaudio-module-bluetooth
sudo apt-get -y install gnome-bluetooth indicator-bluetooth 

#install update manger 
sudo apt-get -y install ubuntu-advantage-tools
