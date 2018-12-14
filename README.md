# NAFABox (Nomad Astronomy For All)
Installation scripts for NAFABox installation.

The scripts are compatible with the Tinker Board, the Raspberry Pi 2b/3b/3b+ as well as with an x86 ubuntu Mate system. 
Requires a SD card or a place on the hard drive of more than 16go.



### Step by Step for TinkerBoard (or other armhf board Armbian compatible):

1/ Install ARMBIAN (default) distribution (via Etcher)

https://dl.armbian.com/tinkerboard/Ubuntu_xenial_default_desktop.7z (or other board xenial default/next ubuntu image)


2/ Download zip file :  https://github.com/Patrick-81/NAFABox/archive/master.zip

3/ Get the folder as zip file and expanse it to your tinkerboard desktop

4/ Open the folder

5/ Start Pre_Install.sh 

`$ ./Pre_Install.sh` 
( for french azerty keyboard : `:!Pre°Instqll:sh` ) 

6/ After the end of Pre_Install script open new terminal. You can start Install.sh script 

`$ ./Install.sh` 
( for french azerty keyboard : `:!Instqll:sh` ) 

7/ in file menu "open terminal" (right click)

8/ answer to the questions when you are asked for your password or a "y/n", fill the menus when needed.

9/ When finished shutdown and restart your board.

### For Raspberry Pi 2/3 :

1/ Install Ubuntu Mate (16.04.2) distribution (via Etcher)

https://ubuntu-mate.org/raspberry-pi/ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz

2/ Download zip file :  https://github.com/Patrick-81/NAFABox/archive/master.zip

3/ Get the folder as zip file and expanse it to your pi desktop

... Same instruction ...

### For X86 Ubuntu Linux system :

1/ Install Ubuntu Mate (18.04.1) distribution (via Etcher for USB installation)

http://cdimage.ubuntu.com/ubuntu-mate/releases/18.04/release/ubuntu-mate-18.04.1-desktop-amd64.iso

2/ Download zip file :  https://github.com/Patrick-81/NAFABox/archive/master.zip

3/ Get the folder as zip file and expanse it to your Linux Mate desktop

4/ __Check that you have access to "APT" (auto update disable,...)__

... Same instruction ...


### documentation for TinkerBoard : https://lroge.scenari-community.org/KstarsEkosIndi/#Nafabox_1
### documentation for Raspberry Pi 2/3 : https://lroge.scenari-community.org/KstarsEkosIndi/#PI

__User URL :__

- Indiwebmanger : IP:8624
- BrowsePy : IP:8180
- X11VNC : IP:5900
- NoVNC : IP:5901
- Webdav : IP:443

For NAFABox OS Image :
https://share.obspm.fr/index.php/s/oGtH7pbD9ZsyTTG
