# NAFABox (Nomad Astronomy For All)

Script d'installation pour Créer une NAFABox.

Ces scripts sont compatibles avec les Raspberry Pi 4b/3b+ (Ubuntu Mate).   
Les scripts ont été testés avec Ubuntu Xenial (16.04 LTS) et Ubuntu Bionic (18.04 LTS).  
Il est recomandé d'utiliser **Ubuntu Bionic (18.04 LTS)**.

Il est nécessaire de disposer d'au moins 10Go d'espace de stockage ou d'une Carte SD de 16Go au minimum ( index d'astrométrie non compris)  

**ATTENTION :** Vérifier que les mises à jour automatiques sont désactivées afin qu'elles n'interfèrent pas avec les scripts.

### Etape par étape pour les Raspberry Pi 4b/3b+ :

__1-__ Installer la distribution Ubuntu Server Bionic (18.04 LTS) via ce tuto.   

https://github.com/Patrick-81/NAFABox/blob/master/doc/tuto_install_rpi4.md  

__2-__ Télécharger :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
ou  
__2bis-__ Dans votre home : `git clone https://github.com/Patrick-81/NAFABox.git`

__3-__ Décompresser le fichier zip ( juste pour 2/)

__4-__ Ouvrez le dossier ainsi créé

__5-__ lancer **Pre_Install.sh** dans un terminal (avec un clic droit dans le dossier)

`$ ./Pre_Install.sh` 

Vous pouvez choisir d'installer la langue francaise et le clavier si ce n'est pas déjà fait.

__6-__ Une fois le script Pre_Install fini, fermer le terminal puis redémarer.

__Si vous avez modifié la langue,__ le systeme vas vous proposer de renomé les dossiers utilisateurs, accepter puis redémarer.
A cause du mode de fonctionnement, après le redémarage, il faut suprimer l'ancien dossier correspondant au bureau ( supprimer le dossier Desktop pour un passage d'anglais au français).   

ouvrir un nouveau terminal.

Lancer **Install.sh**

`$ ./Install.sh` 

__7-__ répondez aux questions lorsque vous y êtes invité, et entrez votre mot de passe quand c'est demandé, remplissez les menus si nécessaire.

__8-__ Quand tout est fini, redémarrer.


### Documentation pour les Raspberry Pi 3b/3b+/4b (obsolete) :    
http://nafabox.linux-astro.fr/#nafabox

### Documentation pour crée un HotSpot pour Raspberry Pi 3b/3b+/4b et systeme X86 :   


### Documentation pour installer Un RTC sur Raspberry Pi 3b/3b+/4b :   
https://github.com/Patrick-81/NAFABox/blob/master/doc/Tuto_rtc_raspberry.md

### Documentation pour le mappage persistant pour les péripheriques serial/usb (en anglais):   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html

### Tuto résolution décran pour Raspberry PI 3b/3b+/4b :
https://github.com/Patrick-81/NAFABox/blob/master/doc/Resolution_rpi.md
https://github.com/Patrick-81/NAFABox/blob/master/doc/Amelioration_affichage_rpi.md


### pour récupérer une image toute faite de la NAFABox :   
https://share.obspm.fr/index.php/s/WowXMAZkHPd3K9j

**Miroir pour les dernières versions :**  
https://1drv.ms/f/s!AlFrxWojM_Hflr0R80wOKHzWQMI88g   
https://drive.google.com/drive/folders/19rKybLnewPy2NaOpZ7BoXR5x_koXWGFJ?usp=sharing  

### Tuto pour utiliser les images :   
https://nafabox.linux-astro.fr/#images
