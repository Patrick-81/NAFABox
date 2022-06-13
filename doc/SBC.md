# NAFABox (Nomad Astronomy For All)

**ATTENTION :**   
La Tinkerboard n'est plus la carte ofiiciel du projet elle est remplacé par le Raspberry Pi4B (4 ou 8Go).   

# Script d'installation pour Créer une NAFABox.

Les scripts ont été testés avec Ubuntu Focal (20.04 LTS) et Ubuntu Jammy (22.04 LTS).  
Il est recomandé d'utiliser **Ubuntu Jammy (22.04 LTS)** (ou Focal si non disponible)

Il est nécessaire de disposer d'au moins 10Go d'espace de stockage ou d'une Carte SD de 16Go au minimum ( index d'astrométrie non compris)  

**ATTENTION :** Vérifier que les mises à jour automatiques sont désactivées afin qu'elles n'interfèrent pas avec les scripts.


### Etape par étape pour la TinkerBoard/S (ou une autre carte (ARMHF/arm32/armv7) compatible avec Armbian):

__1-__ Installer la distribution ARMBIAN (Xubuntu) via Balena Etcher (https://github.com/balena-io/etcher/releases) ou Raspberry Pi Imager (https://www.raspberrypi.com/software/).    

## Les Raspberry Pi 2B/3B/3B+/4B/400 :
https://github.com/Patrick-81/NAFABox/blob/master/doc/tuto_install_rpi4.md

## Les autres SBC (via Armbian):
__Pour Jammy :__   
- Pour la NanoPi-M4 :    
https://armbian.site-meganet.com/dl/nanopim4/archive/Armbian_22.05.1_Nanopim4_jammy_edge_5.18.0_xfce_desktop.img.xz    
https://armbian.hosthatch.com/archive/nanopim4/archive/Armbian_22.02.1_Nanopim4_jammy_edge_5.16.11_xfce_desktop.img.xz    

- Pour la Tinkerboard/S :    
TODO    

__Pour Focal :__    
- Pour la Tinkerboard/S :  
https://armbian.site-meganet.com/dl/tinkerboard/archive/Armbian_22.05.1_Tinkerboard_focal_current_5.15.35_xfce_desktop.img.xz    


__Pour Bionic :__    
- Pour la NanoPi-M4 :    
https://armbian.hosthatch.com/archive/nanopim4/archive/Armbian_5.98_Nanopim4_Ubuntu_bionic_default_4.4.192_desktop.7z    
https://armbian.hosthatch.com/archive/nanopim4/archive/Armbian_21.02.1_Nanopim4_bionic_legacy_4.4.213_desktop.img.xz    

- Pour la Tinkerboard/S :  
https://armbian.systemonachip.net/archive/tinkerboard/archive/Armbian_5.95_Tinkerboard_Ubuntu_bionic_default_4.4.190_desktop.7z    
https://armbian.systemonachip.net/archive/tinkerboard/archive/Armbian_21.02.1_Tinkerboard_bionic_legacy_4.4.213_desktop.img.xz    
https://imola.armbian.com/archive/tinkerboard/archive/Armbian_5.95_Tinkerboard_Ubuntu_bionic_default_4.4.190_desktop.7z    
https://imola.armbian.com/archive/tinkerboard/archive/Armbian_21.02.1_Tinkerboard_bionic_legacy_4.4.213_desktop.img.xz    


Puis démarrer l'image et suivez la procédure d'installation standard (Attention: par défaut Armbian est en QWERTY)
Il vas vous demander de créer un mots de passe superutilisateur (root), puis votre nom d'utilisateur et son mots de passe (de préférence mettre le même que le root) et enfin redémarer.

Pour freezer la version de armbian : [tuto](https://github.com/Patrick-81/NAFABox/blob/master/doc/Switch_kernel_armbain.md#optionnel-mais-conseill%C3%A9-surtout-en-version-next-et-nightly)

**ATTENTION** Il faut redémarer la carte avant toute manipulation     

__2-__ Dans un terminal pour redéfinir votre clavier : `sudo dpkg-reconfigure keyboard-configuration` puis redémarez   

__3-__ Télécharger :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
ou  
__3bis-__ Dans votre home `cd ~`:   
`sudo apt install git`   
`git clone https://github.com/Patrick-81/NAFABox.git`

__4-__ Décompresser le fichier zip ( juste pour 2/)

__5-__ Ouvrez le dossier ainsi créé

__6-__ Il est conseiller de faire le ménage dans Armbian pour enlever les logiciels inutiled pour l'astronomie.   
Dans cette optique nous avons créer un script destiné à nettoyer Armbian dans sa configuration desktop de base.

Vous pouvez le lancer via le terminal (avec un clic droit dans le dossier)

`$ ./Clean_Install.sh` 
( Pour un clavier Francais AZERTY : `:!Cleqn°Instqll:sh` ) 

__7-__ lancer **Pre_Install.sh** dans un terminal (avec un clic droit dans le dossier)

`$ ./Pre_Install.sh` 
( Pour un clavier Francais AZERTY : `:!Pre°Instqll:sh` ) 

Vous pouvez choisir d'installer la langue francaise si ce n'est pas déjà fait.

__8-__ Une fois le script __Pre_Install__ fini, fermer le terminal puis redémarer.

__Si vous avez modifié la langue,__ le systeme vas vous proposer de renomé les dossiers utilisateurs, accepter puis redémarer. A cause du mode de fonctionnement, après le redémarage, il faut suprimer l'ancien dossier correspondant au bureau ( supprimer le dossier __Desktop__ pour un passage d'anglais au français).    
__Attention__ Ne pas supprimer le dossier __Desktop__ si c'est le seul présent.

ouvrir un nouveau terminal.

Lancer une mise a jour :    
`$ sudo apt update`      
`$ sudo apt upgrade -y`    
redémarer

ouvrir un nouveau terminal.    
Lancer __Install.sh__

`$ ./Install.sh` 

__9-__ répondez aux questions lorsque vous y êtes invité, et entrez votre mot de passe quand c'est demandé, remplissez les menus si nécessaire.

__10-__ Quand tout est fini vous devez redémarrer.


### Documentation pour une SBC (obsolète):   
http://nafabox.linux-astro.fr/#Nafabox_1

### Documentation pour créer un HotSpot pour SBC :  
https://github.com/Patrick-81/NAFABox/blob/master/doc/Install_Hotspot_Armbian.md   

### Documentation pour installer Un RTC sur SBC (avec i2c) :   
https://github.com/Patrick-81/NAFABox/blob/master/doc/Tuto_rtc_tinkerboard.md

### Documentation pour le mappage persistant pour les péripheriques serial/usb (en anglais):   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html

### Documentation pour le changement de kernel sur Armbian :
https://github.com/Patrick-81/NAFABox/blob/master/doc/Switch_kernel_armbian.md

### Documentation activation acceleration graphique sur Tinkerboard/S (seulement sur Bionic et Focal):
https://github.com/Patrick-81/NAFABox/blob/master/doc/tuto_acceleration_graphique_tinker.md

### Documentation activation acceleration graphique sur Nanopi-M4 (seulement sur Bionic et Focal):
https://github.com/Patrick-81/NAFABox/blob/master/doc/tuto_acceleration_graphique_nanopim4.md

### pour récupérer une image toute faite de la NAFABox :   
https://share.obspm.fr/index.php/s/WowXMAZkHPd3K9j

**Miroir pour les dernières versions :**  
https://1drv.ms/f/s!AlFrxWojM_Hflr0R80wOKHzWQMI88g    
https://drive.google.com/drive/folders/19rKybLnewPy2NaOpZ7BoXR5x_koXWGFJ?usp=sharing  

### Tuto pour utiliser les images :   
https://nafabox.linux-astro.fr/#images
