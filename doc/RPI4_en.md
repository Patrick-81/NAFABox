# NAFABox (Nomad Astronomy For All)

Installation scripts to build  NAFABox.

Those scripts are for Raspberry Pi 4b (Ubuntu Mate).
Those scripts have been tested with Ubuntu Bionic (18.04 LTS) and Ubuntu Focal (20.04LTS) 
You better have to use **Ubuntu Bionic (20.04 LTS)**.

You need at least 10Gb of storage space or a 16Gb SD card. You will need this space to store astrometry indexes (not iincluded in the installation)

**Warning :** Be aware that automatic updates were inactives to avoid interferences with scrips.

### Step by Step for Raspberry Pi 4b :

__1-__ Install distribution Ubuntu Mate Focal distribution (20.04 LTS) using Raspberry Pi Installer or Etcher.

https://releases.ubuntu-mate.org/focal/arm64/ubuntu-mate-20.04.1-desktop-arm64+raspi.img.xz

if you need use UBUNTU Server (tuto) : https://github.com/Patrick-81/NAFABox/blob/master/doc/tuto_install_rpi4.md

__2-__ Download :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
or  
__2bis-__ in your home dir: `git clone https://github.com/Patrick-81/NAFABox.git`

__3-__ Unzip the file( only for 2/)

__4-__ Enter the NAFABox directory 

__5-__ Run **Pre_Install.sh** in a terminal  (right clic in folder)

`$ ./Pre_Install.sh` 

You can choose to install your language (default english or french) for your keyboard is not yet done.

__6-__ Once the scriptPre_install ended, close terminal and reboot.

__If you have change language,__ the system will suggest you rename the user files, accept then restart.
Because of the operating mode, after restarting, you must delete the old folder corresponding to the desktop (delete the Desktop folder to switch from English to French for example). 

Update system :    
`$ sudo apt update`    
`$ sudo apt upgrade -y`   
reboot

open a new terminal.    
Run **Install.sh**

`$ ./Install.sh` 

__7-__ Answer to the asked questions each time you are sollicited, enter a password when requested, fill in the menus if mandatory.

__8-__ When all done you can reboot the system.


### Documentation to create HotSpot for Raspberry Pi 3b/3b+/4b and X86 System (in french):   


### Documentation to instal a RTC on Raspberry Pi 3b/3b+/4b :   
https://github.com/Patrick-81/NAFABox/blob/master/doc/Tuto_rtc_raspberry.md

### Documentation to do a persistenat mapping for serial/usb peripherals:   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html

### Tuto to set screen resolution on Raspberry PI 3b/3b+/4b :
https://github.com/Patrick-81/NAFABox/blob/master/doc/Resolution_rpi.md   
https://github.com/Patrick-81/NAFABox/blob/master/doc/Amelioration_affichage_rpi.md    


### to get a ready made image of the NAFABox :   
https://share.obspm.fr/index.php/s/WowXMAZkHPd3K9j   

**Mirrors for last versions :**  
https://1drv.ms/f/s!AlFrxWojM_Hflr0R80wOKHzWQMI88g   
https://drive.google.com/drive/folders/19rKybLnewPy2NaOpZ7BoXR5x_koXWGFJ?usp=sharing   

### Tuto to use images :   
https://nafabox.linux-astro.fr/#images
