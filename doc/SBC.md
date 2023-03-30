# NAFABox (Nomad Astronomy For All)

**ATTENTION :**   
La Tinkerboard n'est plus la carte officielle du projet elle est remplacé par le Raspberry Pi4B (4 ou 8Go).   

# Script d'installation pour Créer une NAFABox.

Les scripts ont été testés avec Ubuntu Focal (20.04 LTS) et Ubuntu Jammy (22.04 LTS).  
Il est recommandé d'utiliser **Ubuntu Jammy (22.04 LTS)** (ou Focal si non disponible)

Il est nécessaire de disposer d'au moins 10Go d'espace de stockage ou d'une Carte SD de 32Go au minimum (index d'astrométrie non compris)  

**ATTENTION :** Vérifier que les mises à jour automatiques sont désactivées afin qu'elles n'interfèrent pas avec les scripts.
[Tuto pour désactiver les mises à jour automatique](https://github.com/Patrick-81/NAFABox/blob/master/doc/update_ubuntu.md)

### Etape par étape pour les cartes compatible Armbian (ou une autre carte (AARCH64/arm64/armv8) :
Il existe un autre tuto pour obtenir un système Xubuntu plus léger avec moins de logiciel inutile: [Tuto](https://github.com/Patrick-81/NAFABox/blob/master/doc/tuto_minimal_armbian.md)

__1-__ Installer la distribution ARMBIAN (Xubuntu) via [Balena Etcher](https://github.com/balena-io/etcher/releases) ou [Raspberry Pi Imager](https://www.raspberrypi.com/software/).    

## Les Raspberry Pi Zero 2W/3B/3B+/3A+/4B/400/CM3/CM3+/CM4 :
[Tuto RPI](https://github.com/Patrick-81/NAFABox/blob/master/doc/tuto_install_rpi4.md)

## Les autres SBC (via Armbian):
__Pour Jammy :__   
- Pour la NanoPi-M4 :    
[NanoPi M4 Jammy](https://armbian.site-meganet.com/dl/nanopim4/archive/Armbian_23.02.2_Nanopim4_jammy_current_5.15.93_xfce_desktop.img.xz)    
[NanoPi M4 Jammy mirror](https://armbian.hosthatch.com/dl/nanopim4/archive/Armbian_23.02.2_Nanopim4_jammy_current_5.15.93_xfce_desktop.img.xz)    

__Pour Focal :__    
- Pour la NanoPi-M4 :    
[NanoPi M4 focal](https://armbian.hosthatch.com/archive/nanopim4/archive/Armbian_22.02.1_Nanopim4_focal_current_5.15.25_xfce_desktop.img.xz)    
[NanoPi M4 focal mirror](https://armbian.site-meganet.com/dl/nanopim4/archive/Armbian_22.05.1_Nanopim4_focal_current_5.15.35_xfce_desktop.img.xz)    

Puis démarrer l'image et suivez la procédure d'installation standard (Attention: par défaut Armbian est en QWERTY)
Il va vous demander de créer un mot de passe superutilisateur (root), puis votre nom d'utilisateur et son mot de passe (de préférence mettre le même que le root) et enfin redémarrer.
A partir de la version Jammy il faudra choisir `bash` vous demandera aussi la langue et la time zone désirée (mais pas le clavier)   
Pour freezer la version de armbian : [tuto](https://github.com/Patrick-81/NAFABox/blob/master/doc/Switch_kernel_armbain.md#optionnel-mais-conseill%C3%A9-surtout-en-version-next-et-nightly)

**ATTENTION** Il faut redémarrer la carte avant toute manipulation     

__2-__ Dans un terminal pour redéfinir votre clavier : `sudo dpkg-reconfigure keyboard-configuration` puis redémarrez   

__3bis-__ Dans votre home `cd ~`:   
`sudo apt install git`   
`git clone https://github.com/Patrick-81/NAFABox.git`   
ou   
__3bis-__ Télécharger :  https://github.com/Patrick-81/NAFABox/archive/master.zip   

__4-__ Décompresser le fichier zip ( juste pour 2/)

__5-__ Ouvrez le dossier ainsi créé

__6-__ Il est conseiller de faire le ménage dans Armbian pour enlever les logiciels inutile pour l'astronomie.   
Dans cette optique, nous avons créé un script destiné à nettoyer Armbian dans sa configuration desktop de base.

Vous pouvez le lancer via le terminal (avec un clic droit dans le dossier utility de la NAFABox)

`$ ./Clean_Armbian_Install.sh`

__7-__ lancer **Pre_Install.sh** dans un terminal (avec un clic droit dans le dossier NAFABox)

`$ ./Pre_Install.sh`

Vous pouvez choisir d'installer la langue française si ce n'est pas déjà fait.

__8-__ Une fois le script __Pre_Install__ fini, fermer le terminal puis redémarrer.

__Si vous avez modifié la langue,__ le système vas vous proposer de renommer les dossiers utilisateurs, accepter puis redémarrer. A cause du mode de fonctionnement, après le redémarrage, il faut peut être supprimer l'ancien dossier correspondant au bureau ( supprimer le dossier __Desktop__ pour un passage d'anglais au français).    
__Attention__ Ne pas supprimer le dossier __Desktop__ si c'est le seul présent.

Ouvrir un nouveau terminal.

Lancer une mise à jour :    
`$ sudo apt update`      
`$ sudo apt upgrade -y`    
Redémarrer

Ouvrir un nouveau terminal.    
Lancer __Install.sh__

`$ ./Install.sh` 

__9-__ répondez aux questions lorsque vous y êtes invité et entrez votre mot de passe quand c'est demandé, remplissez les menus si nécessaire.

__10-__ Quand tout est fini vous devez redémarrer.

__11-__ Installation complémentaire (Acceleration graphique, complément des langues, point d'accès wifi, resolution d'écran, RTC,...) :   
[Tuto additionnel pour les cartes Armbian](https://github.com/Patrick-81/NAFABox/blob/master/doc/Tuto_armbian.md)   
[Tuto additionnel pour les cartes RPI](https://github.com/Patrick-81/NAFABox/blob/master/doc/Tuto_RPI.md)
