# Install Ubuntu image for RPI4 and RPI3b+ :   

this tutorial explains how to switch from Ubuntu server 20.04.x (64bit or 32bit) to an ubuntu with a graphical interface. 

## Download and install :

Go here for download last Image for RPI4B/RPI3B+ :   
[RPI Ubuntu server official realese 64bit](https://cdimage.ubuntu.com/releases/20.04.3/release/ubuntu-20.04.3-preinstalled-server-arm64+raspi.img.xz)   
[RPI Ubuntu server official realese 32bit](https://cdimage.ubuntu.com/releases/20.04.3/release/ubuntu-20.04.3-preinstalled-server-armhf+raspi.img.xz)   

Otherwise you can directly go through the Raspberry Pi Imager tool :   
[Raspberry Pi Imager](https://www.raspberrypi.org/software/)   

Install this image with Etcher or Raspberry Pi Imager and put micro SDcard on your rpi4/rpi3b+

## Install desktop on Rpi4/Rpi3B Ubuntu server :

### Create new sudo user (nafa for exemple):

Log in to ubuntu user (login : ubuntu , pwd : ubuntu)

`sudo adduser nafa`   
`sudo adduser nafa sudo`   
`reboot`

### Delete Ubuntu user :

Log in to nafa user

`sudo deluser ubuntu`   
`sudo rm -R /home/ubuntu/`

### Delete Cloud-init  (for more fast boot)

`sudo apt purge cloud-init`   
`sudo rm -rf /etc/cloud/`   
`sudo rm -rf /var/lib/cloud`   
`reboot`

### Install Desktop manually :

`sudo apt update`  
 
__Xubuntu :__ `sudo apt install xubuntu-desktop`  
__Ubuntu Mate :__ `sudo apt install ubuntu-mate-desktop ubuntu-mate-welcome software-boutique` 
  
`reboot`

### Install Desktop auto (ubuntu mate for example):

`git clone https://github.com/wimpysworld/desktopify.git`   
`cd desktopify`   
`sudo ./desktopify --de ubuntu-mate`   

if you need setup wizard on the next boot : 

`sudo ./desktopify --oem --de ubuntu-mate`

### install gdm3 (for autoboot/login)(for xubuntu) :

`sudo apt install gdm3` --> select gdm3

#### edit gdm3 for autoboot/login
`sudo nano /etc/gdm3/custom.conf`   
--> uncomment autoboot section (2 lines) and replace default user (user1)  
`reboot`


### Error Correction just for <v17:    
`sudo nano /etc/modules-load.d/cups-filters.conf` --> comment all lines   

### Error Correction (for xubuntu) :    
`sudo apt remove light-locker`   
`sudo rm /var/crash/*`   
`reboot`

### Remove screensaver (for xubuntu):

In program menu select **Settings**-->**Screensaver** and desactivate Screensaver
