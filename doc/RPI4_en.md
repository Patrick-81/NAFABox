# NAFABox (Nomad Astronomy For All)

Installation scripts to build  NAFABox.

Those scripts are for Raspberry Pi 4b (Ubuntu Mate).
Those scripts have been tested with Ubuntu Xenial (16.04 LTS) and Ubuntu Bionic (18.04LTS) 
You better have to use **Ubuntu Bionic (18.04 LTS)**.

You need at least 10Gb of storage space or a 16Gb SD card. You will need this space to store astrometry indexes (not iincluded in the installation)

**Warning :** Be aware that automatic updates were inactives to avoid interferences with scrips.

### Step by Step for Raspberry Pi 4b :

1/ Install distribution Ubuntu Mate Bionic distribution (18.04 LTS) using Etcher.

https://share.obspm.fr/index.php/s/6z7qFmkyQW9ACpm --> for 4b

Then boot on the image et follow the standard installation procedure

2/ Download :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
or  
2bis/in your home dir: `git clone https://github.com/Patrick-81/NAFABox.git`

3/ Unzip the file( only for 2/)

4/ Enter the NAFABox directory 

5/ Run **Pre_Install.sh** in a terminal  (right clic in folder)

`$ ./Pre_Install.sh` 

You can choose to install your language (default english or french) for your keyboard is not yet done.

6/ Once the svript Pre_install ended, close the terminal than open a new terminal and run **Install.sh**

`$ ./Install.sh` 

7/ Answer to the asked questions each time you are sollicited, enter a password when requested, fill in the menus if mandatory.

8/ When all done you can reboot the system.


### Documentation for Raspberry Pi 3b/3b+/4b :    
http://nafabox.linux-astro.fr/#nafabox

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
