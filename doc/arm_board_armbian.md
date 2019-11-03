# NAFABox (Nomad Astronomy For All)

Script d'installation pour Créer une NAFABox.

Ces scripts sont compatibles avec les carte compatible Armbian .   
Les scripts ont été testés avec Ubuntu Xenial (16.04 LTS) et Ubuntu Bionic (18.04 LTS).  
Il est recomandé d'utiliser **Ubuntu Bionic (18.04 LTS)**.

Il est nécessaire de disposer d'au moins 10Go d'espace de stockage ou d'une Carte SD de 16Go au minimum ( index d'astrométrie non compris)  

**ATTENTION :** Vérifier que les mises à jour automatiques sont désactivées afin qu'elles n'interfèrent pas avec les scripts.


### Etape par étape pour la TinkerBoard/S (ou une autre carte (ARMHF/arm32/armv7) compatible avec Armbian):

1/ Installer la distribution ARMBIAN ( version default Bionic) via Etcher.

https://www.armbian.com/download/ (version default bionic desktop)

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


### Documentation pour créer un HotSpot sur Armbian :  
https://github.com/Patrick-81/NAFABox/blob/master/doc/Install_Hotspot_Armbian.md   

### Documentation pour le mappage persistant pour les péripheriques serial/usb (en anglais):   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html

### Documentation pour le changement de kernel sur Armbian :
https://github.com/Patrick-81/NAFABox/blob/master/doc/Switch_kernel_armbian.md

