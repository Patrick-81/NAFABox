# NAFABox (Nomad Astronomy For All)

Script d'installation pour Créer une NAFABox.

Ces scripts sont compatibles avec la TinkerBoard (Armbian, Ubuntu) et la TinkerBoard S (Armbian, Ubuntu).
Les scripts ont été testés avec Ubuntu Xenial (16.04 LTS) et Ubuntu Bionic (18.04 LTS).  
Il est recomandé d'utiliser **Ubuntu Bionic (18.04 LTS)**.

Il est nécessaire de disposer d'au moins 10Go d'espace de stockage ou d'une Carte SD de 16Go au minimum ( index d'astrométrie non compris)  

**ATTENTION :** Vérifier que les mises à jour automatiques sont désactivées afin qu'elles n'interfèrent pas avec les scripts.


### Etape par étape pour la TinkerBoard/S (ou une autre carte (ARMHF/arm32/armv7) compatible avec Armbian):

1/ Installer la distribution ARMBIAN ( version default Bionic) via Etcher.

https://dl.armbian.com/tinkerboard/Ubuntu_bionic_default_desktop.7z (ou une autre image pour une autre carte)

Puis démarrer l'image et suivez la procédure d'installation standard (Attention: par défaut Armbian en QWERTY)

**ATTENTION** Il faut redémarer la carte avant toute manipulation

2/ Télécharger :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
ou  
2bis/ Dans votre home : `git clone https://github.com/Patrick-81/NAFABox.git`

3/ Décompresser le fichier zip ( juste pour 2/)

4/ Ouvrez le dossier ainsi créé

5/ lancer **Pre_Install.sh** dans un terminal (avec un clic droit dans le dossier)

`$ ./Pre_Install.sh` 
( Pour un clavier Francais AZERTY : `:!Pre°Instqll:sh` ) 

Vous pouvez choisir d'installer la langue francaise et le clavier si ce n'est pas déjà fait.

6/ Une fois le script Pre_Install fini, fermer le terminal puis ouvrir un nouveau terminal. Lancer **Install.sh**

`$ ./Install.sh` 
( Pour un clavier Francais AZERTY : `:!Instqll:sh` ) 

7/ répondez aux questions lorsque vous y êtes invité, et entrez votre mot de passe quand c'est demandé, remplissez les menus si nécessaire.

8/ Quand tout est fini vous pouvez redémarrer.


### Documentation pour la TinkerBoard/S :   
http://nafabox.linux-astro.fr/#Nafabox_1

### Documentation pour créer un HotSpot pour Tinkerboard/S :  
https://github.com/Patrick-81/NAFABox/blob/master/doc/Install_Hotspot_Armbian.md   

### Documentation pour installer Un RTC sur Tinkerboard/S :   
https://github.com/Patrick-81/NAFABox/blob/master/doc/Tuto_rtc_tinkerboard.md

### Documentation pour le mappage persistant pour les péripheriques serial/usb (en anglais):   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html

### Documentation pour le changement de kernel sur Armbian :
https://github.com/Patrick-81/NAFABox/blob/master/doc/Switch_kernel_armbian.md

### Documentation activation acceleration graphique :
https://github.com/Patrick-81/NAFABox/blob/master/doc/tuto_acceleration_graphique_tinker.md

### pour récupérer une image toute faite de la NAFABox :   
https://share.obspm.fr/index.php/s/oGtH7pbD9ZsyTTG

**Miroir pour les dernières versions :**  
https://1drv.ms/f/s!AlFrxWojM_Hflr0R80wOKHzWQMI88g   
https://drive.google.com/drive/folders/19rKybLnewPy2NaOpZ7BoXR5x_koXWGFJ?usp=sharing  

### Tuto pour utiliser les images :   
https://nafabox.linux-astro.fr/#images

*********************
** English version **
*********************

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
https://share.obspm.fr/index.php/s/oGtH7pbD9ZsyTTG

**Mirrors for the latest versions :**  
https://1drv.ms/f/s!AlFrxWojM_Hflr0R80wOKHzWQMI88g   
https://drive.google.com/drive/folders/19rKybLnewPy2NaOpZ7BoXR5x_koXWGFJ?usp=sharing  

### Tuto to use images :   
https://nafabox.linux-astro.fr/#images


