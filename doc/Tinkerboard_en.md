# NAFABox (Nomad Astronomy For All)

Installation scripts to build a NAFABox.

CThose scripts are for TinkerBoard (Armbian, Ubuntu) and TinkerBoard S (Armbian, Ubuntu).
Scripts have been tested with Ubuntu Xenial (16.04 LTS) et Ubuntu Bionic (18.04 LTS).  
**Ubuntu Bionic (18.04 LTS)** is highly recommanded

You need at least 10Gb of storage space or a 16Gb SD card to store astrometry indexes (not provided in installation)  

**Warning :** Verify that automatic updates are disabled to avoid interferences with scripts.


### Step by step for TinkerBoard/S (or nay other card (ARMHF/arm32/armv7) compatible with Armbian):

1/ Install ARMBIAN distribution (Bionic default version) with Etcher.

https://dl.armbian.com/tinkerboard/Ubuntu_bionic_default_desktop.7z (or other armbian image for your card)

Boot on your mage et follow the standard install procedure (warning: default keyboard is QWERTY)

**Warning** Reboot the card before continuing

2/ Download :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
or  
2bis/ In your home : `git clone https://github.com/Patrick-81/NAFABox.git`

3/ Unzip the file ( only for point 2/)

4/ Enter the NAFABox folder

5/ run **Pre_Install.sh** in a terminal (right click in the folder to open a terminal)

`$ ./Pre_Install.sh` 
( If you are in QWERTY keyboard : `:!Pre°Instqll:sh` ) 

You can choose french keyboard if not yet done.

6/ Once the script Pre_Install ended close the terminal and open a new one and inside it run **Install.sh**

`$ ./Install.sh` 
( For a QWERTY keyboard : `:!Instqll:sh` ) 

7/ Follow instructions and answer the asked questions when requested, enter your password each time requested and fill in menus when mandatory.

8/ When all done reboot the card.


### Documentation for TinkerBoard/S :   
http://nafabox.linux-astro.fr/#Nafabox_1

### Documentation to create a HotSpot on Tinkerboard/S :  
https://github.com/Patrick-81/NAFABox/blob/master/doc/Install_Hotspot_Armbian.md   

### Documentation to install RTC on Tinkerboard/S :   
https://github.com/Patrick-81/NAFABox/blob/master/doc/Tuto_rtc_tinkerboard.md

### Documentation to map serial/USB peripherals (english):   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html

### Documentation to change teh kernel on Armbian :
https://github.com/Patrick-81/NAFABox/blob/master/doc/Switch_kernel_armbian.md

### Documentation to activate graphic acceleration :
https://github.com/Patrick-81/NAFABox/blob/master/doc/tuto_acceleration_graphique_tinker.md

### To get a full functionnal NAFABox image :   
https://share.obspm.fr/index.php/s/WowXMAZkHPd3K9j

**Mirrors for the latest versions :**  
https://1drv.ms/f/s!AlFrxWojM_Hflr0R80wOKHzWQMI88g   
https://drive.google.com/drive/folders/19rKybLnewPy2NaOpZ7BoXR5x_koXWGFJ?usp=sharing  

### Tuto to use images :   
https://nafabox.linux-astro.fr/#images


