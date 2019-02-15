# NAFABox (Nomad Astronomy For All)

Script d'installation pour Créer une NAFABox.

Ces scripts sont compatible avec la TinkerBoard (Armbian, Ubuntu), TinkerBoard S (Armbian, Ubuntu), Raspberry Pi 3b/3b+ (Ubuntu Mate) et les système classique amd64/x86_64 (Ubuntu).   
Les scripts ont été testé avec Ubuntu Xenial (16.04 LTS) et Ubuntu Bionic (18.04 LTS).  
Il est recomander d'utiliser **Ubuntu Bionic (18.04 LTS)**.

Il est necessaire de disposé d'au moins 10Go d'espace de stockage ou d'une Carte SD de 16Go au minimum ( index d'astrometrie non compris)  

**ATTENTION :** Vérifier que les mise a jours automatique sont désactivé afin qu'elle n'interfère pas avec les scripts.


### Etape par etape pour la TinkerBoard/S (ou une autre carte (ARMHF/arm32/armv7) compatible avec Armbian):

1/ Installer la distribution ARMBIAN ( version Next Bionic) via Etcher.

https://dl.armbian.com/tinkerboard/Ubuntu_bionic_next_desktop.7z (ou une autre image pour une autre carte)

Puis démarer l'image et suivez la procedure d'installation standard (Attention: par defaut Armbian en QWERTY)

2/ Télecharger :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
ou  
2bis/ Dans votre home : `git clone https://github.com/Patrick-81/NAFABox.git`

3/ Décompresser le fichier zip ( juste pour 2/)

4/ Ouuvrez le dossier ainsi créé

5/ lancer **Pre_Install.sh** dans un terminal (avec un clique droit dans le dossier)

`$ ./Pre_Install.sh` 
( Pour un clavier Francais AZERTY : `:!Pre°Instqll:sh` ) 

6/ Une fois le script Pre_Install finit, fermer le terminal Puis ouvrer un nouveau terminal. Lancer **Install.sh**

`$ ./Install.sh` 
( Pour un clavier Francais AZERTY : `:!Instqll:sh` ) 

7/ répondez aux questions lorsque vous y êtes invité à entrer votre mot de passe quand c'est demandé, remplissez les menus si nécessaire.

8/ Quand tout sera finit vous pouvez redemarer.

### Pour les Raspberry Pi 3b/3b+ :

1/ Installer la distribution Ubuntu Mate Xenial (16.04 LTS) via Etcher.

https://ubuntu-mate.org/raspberry-pi/ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz

... Same instruction ...

### Pour les systèmes X86_64/Amd64 Ubuntu Linux system :

1/ Installe la distribution **Ubuntu Mate** Bionic (18.04 LTS) via Etcher pour une installation USB.

http://cdimage.ubuntu.com/ubuntu-mate/releases/18.04/release/ubuntu-mate-18.04.1-desktop-amd64.iso   
ou **Xubuntu** Bionic (18.04 LTS):   
http://cdimage.ubuntu.com/xubuntu/releases/18.04/release/xubuntu-18.04.1-desktop-amd64.iso   
ou **Lubuntu** Bionic (18.04 LTS):  
http://cdimage.ubuntu.com/lubuntu/releases/18.04/release/lubuntu-18.04.1-desktop-amd64.iso   

... Same instruction ...


### Documentation pour la TinkerBoard/S : https://lroge.scenari-community.org/KstarsEkosIndi/#Nafabox_1
### Documentation pour les Raspberry Pi 3b/3b+ : https://lroge.scenari-community.org/KstarsEkosIndi/#PI

### Documentation pour create un HotSpot :

https://github.com/Patrick-81/NAFABox/blob/master/ConfigTinker/InstallationHotspotWifi.pdf

### Documentation installer Un RTC sur Rasperry Pi 3b/3b+ :

https://github.com/Patrick-81/NAFABox/blob/master/ConfigTinker/tuto_rtc_raspberry.md

### Documentation installer Un RTC sur Tinkerboard/S :

https://github.com/Patrick-81/NAFABox/blob/master/ConfigTinker/tuto_rtc_tinkerboard.md

### Documentation port le mappage persistant pour les péripheriques serial/usb (en anglais): 

https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html


__Lien utile :__

- Page Web : IP
- Indiwebmanger : IP:8624
- BrowsePy : IP:8180
- X11VNC : IP:5900
- NoVNC : IP:5901
- Webdav : IP:443
- Nomachine : IP:5000

### pour recuperer une image toute faite de la NAFABox :

https://share.obspm.fr/index.php/s/oGtH7pbD9ZsyTTG

**Miroir pour les dernière version :**

https://1drv.ms/f/s!AlFrxWojM_Hflr0R80wOKHzWQMI88g
https://drive.google.com/drive/folders/19rKybLnewPy2NaOpZ7BoXR5x_koXWGFJ?usp=sharing

### Tuto pour utiliser les images : https://lroge.scenari-community.org/KstarsEkosIndi/#images



