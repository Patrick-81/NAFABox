# Install Ubuntu image for RPI4 and RPI3b+ :

## Download and install last Image Release :

Go here for download last Image for RPI4B/RPI3B+:
[Unofficial RI4 releases](https://github.com/TheRemote/Ubuntu-Server-raspi4-unofficial/releases)


Install this image with Etcher and put micro SDcard on your rpi4/rpi3b+

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

### Install Desktop (xubuntu for exemple) :

`sudo apt update`   
`sudo apt install xubuntu-desktop`   
`reboot`

### install gdm3 (for autoboot/login) :

`sudo apt install gdm3` --> select gdm3

#### edit gdm3 for autoboot/login
`sudo nano /etc/gdm3/custom.conf`   
--> uncomment autoboot section (2 lines) and replace default user (user1)  
`reboot`

### Error Correction just for <v17:    
`sudo nano /etc/modules-load.d/cups-filters.conf` --> comment all lines   

### Error Correction :    
`sudo apt remove light-locker`   
`sudo rm /var/crash/*`   
`reboot`

### Remove screensaver (for xubuntu):

In program menu select **Settings**-->**Screensaver** and desactivate Screensaver
