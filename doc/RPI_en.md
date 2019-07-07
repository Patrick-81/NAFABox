# NAFABox (Nomad Astronomy For All)

Script d'installation pour Créer une NAFABox.

Ces scripts sont compatibles avec la TinkerBoard (Armbian, Ubuntu), TinkerBoard S (Armbian, Ubuntu), Raspberry Pi 3b/3b+ (Ubuntu Mate) et les systèmes classiques amd64/x86_64 (Ubuntu).   
Les scripts ont été testés avec Ubuntu Xenial (16.04 LTS) et Ubuntu Bionic (18.04 LTS).  
Il est recomandé d'utiliser **Ubuntu Bionic (18.04 LTS)**.

Il est nécessaire de disposer d'au moins 10Go d'espace de stockage ou d'une Carte SD de 16Go au minimum ( index d'astrométrie non compris)  

**ATTENTION :** Vérifier que les mises à jour automatiques sont désactivées afin qu'elles n'interfèrent pas avec les scripts.


### Etape par étape pour les Raspberry Pi 3b/3b+ :

1/ Installer la distribution Ubuntu Mate Bionic (18.04 LTS) via Etcher.

https://ubuntu-mate.org/raspberry-pi/ubuntu-mate-18.04.2-beta1-desktop-armhf+raspi-ext4.img.xz --> pour 3b/3b+

Puis démarrer l'image et suivez la procédure d'installation standard

2/ Télécharger :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
ou  
2bis/ Dans votre home : `git clone https://github.com/Patrick-81/NAFABox.git`

3/ Décompresser le fichier zip ( juste pour 2/)

4/ Ouvrez le dossier ainsi créé

5/ lancer **Pre_Install.sh** dans un terminal (avec un clic droit dans le dossier)

`$ ./Pre_Install.sh` 

Vous pouvez choisir d'installer la langue francaise et le clavier si ce n'est pas déjà fait.

6/ Une fois le script Pre_Install fini, fermer le terminal puis ouvrir un nouveau terminal. Lancer **Install.sh**

`$ ./Install.sh` 

7/ répondez aux questions lorsque vous y êtes invité, et entrez votre mot de passe quand c'est demandé, remplissez les menus si nécessaire.

8/ Quand tout est fini vous pouvez redémarrer.


### Documentation pour les Raspberry Pi 3b/3b+ :    
http://nafabox.linux-astro.fr/#nafabox

### Documentation to create HotSpot for Raspberry Pi 3b/3b+ and X86 System (in french):   


### Documentation pour installer Un RTC sur Raspberry Pi 3b/3b+ :   
https://github.com/Patrick-81/NAFABox/blob/master/doc/Tuto_rtc_raspberry.md

### Documentation pour le mappage persistant pour les péripheriques serial/usb (en anglais):   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html

### Tuto résolution décran pour Raspberry PI 3b/b+ :
https://github.com/Patrick-81/NAFABox/blob/master/doc/Resolution_rpi.md
https://github.com/Patrick-81/NAFABox/blob/master/doc/Amelioration_affichage_rpi.md


### pour récupérer une image toute faite de la NAFABox :   
https://share.obspm.fr/index.php/s/oGtH7pbD9ZsyTTG

**Miroir pour les dernières versions :**  
https://1drv.ms/f/s!AlFrxWojM_Hflr0R80wOKHzWQMI88g   
https://drive.google.com/drive/folders/19rKybLnewPy2NaOpZ7BoXR5x_koXWGFJ?usp=sharing  

### Tuto pour utiliser les images :   
https://nafabox.linux-astro.fr/#images


*******************
**English version**
*******************

# NAFABox (Nomad Astronomy For All)

Installation scripts to build  NAFABox.

Those scripts are for Tikerboard  (Armbian, Ubuntu), TinkerBoard S (Armbian, Ubuntu), Raspberry Pi 3b/3b+ (Ubuntu Mate) and classic systems amd64/x86_64 (Ubuntu).

Those scripts have been tested with Ubuntu Xenial (16.04 LTS) and Ubuntu Bionic (18.04LTS) 
You better have to use **Ubuntu Bionic (18.04 LTS)**.
You need at least 10Gb of storage space or a 16Gb SD card. You will need this space to store astrometry indexes (not iincluded in the installation)

**Warning :** Be aware that automatic updates were inactives to avoid interferences with scrips.

### Step by Step for Raspberry Pi 3b/3b+ :

1/ Install distribution Ubuntu Mate Bionic distribution (18.04 LTS) using Etcher.

https://ubuntu-mate.org/raspberry-pi/ubuntu-mate-18.04.2-beta1-desktop-armhf+raspi-ext4.img.xz --> for 3b/3b+

Then boot on the image et follow the standard installation procedure

2/ Download :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
or  
2bis/in your home dir: `git clone https://github.com/Patrick-81/NAFABox.git`

3/ Unzip the file( only for 2/)

4/ Enter the NAFABox directory 

5/ Run **Pre_Install.sh** in a terminal  (right clic in folder)

`$ ./Pre_Install.sh` 

You can choose to install your language (default english or french) for your keyboard is not yet done.

6/ Once the svript Pre_install ended, close the terminal than open a new terminal and run   **Install.sh**

`$ ./Install.sh` 

7/ Answer to the asked questions each time you are sollicited, enter a password when requested, fill in the menus if mandatory.


8/ When all done you can reboot the system.


### Documentation for Raspberry Pi 3b/3b+ :    
http://nafabox.linux-astro.fr/#nafabox

### Documentation to create HotSpot for Raspberry Pi 3b/3b+ and X86 System (in french):   


### Documentation to instal a RT●●●●●●●●●●●C on Raspberry Pi 3b/3b+ :   
https://github.com/Patrick-81/NAFABox/blob/master/doc/Tuto_rtc_raspberry.md

### Documentation to do a persistenat mapping for serial/usb peripherals:   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html

### Tuto to set screen resolution on Raspberry PI 3b/b+ :
https://github.com/Patrick-81/NAFABox/blob/master/doc/Resolution_rpi.md
https://github.com/Patrick-81/NAFABox/blob/master/doc/Amelioration_affichage_rpi.md


### to get a ready made image of the NAFABox :   
https://share.obspm.fr/index.php/s/oGtH7pbD9ZsyTTG

**Mirrors for last versions :**  
https://1drv.ms/f/s!AlFrxWojM_Hflr0R80wOKHzWQMI88g   
https://drive.google.com/drive/folders/19rKybLnewPy2NaOpZ7BoXR5x_koXWGFJ?usp=sharing  

### Tuto to use images :   
https://nafabox.linux-astro.fr/#images
