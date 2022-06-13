# Construction d'un image pour RPI4 et RPI3b+ :   

Ce tuto est destiné à vous accompagner afin de mettre en place un système de base avec interface graphique à l'aide de l'image d'Ubuntu Server 

## Téléchargement et parametrage de base :

Pour installer l'image sur votre carte SD utilisez la logiciel fourni pour le Raspberry Pi :
[Raspberry Pi Imager](https://www.raspberrypi.org/software/)   
Téléchargez le puis installez, le il est compatible avec toutes les platformes !

## Installation de la carte SD (min 32Go, version U3/V30) :

Insérer votre carte SD dans votre ordinateur.   

Sélectionnez "choisissez l'OS" :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_1.JPG)

Sélectionnez "Other general-purpose OS" :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_2.JPG)

Sélectionnez "Ubuntu" :
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_3.JPG)

Sélectionnez "Ubuntu Server 22.04 LTS" (version arm64, 64-bit) :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_4.JPG)

Sélectionnez "Choisissez le Stockage" et selectionnez votre carte SD :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_5.JPG)

Sélectionnez les options afin de parametrer votre nom d'utilisateur, l'acces SSH, la conection wifi, le type de clavier :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_6.JPG)


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
