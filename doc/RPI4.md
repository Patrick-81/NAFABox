# NAFABox (Nomad Astronomy For All)

Script d'installation pour Créer une NAFABox.

Ces scripts sont compatibles avec les Raspberry Pi 4b (Ubuntu Mate).   
Les scripts ont été testés avec Ubuntu Xenial (16.04 LTS) et Ubuntu Bionic (18.04 LTS).  
Il est recomandé d'utiliser **Ubuntu Bionic (18.04 LTS)**.

Il est nécessaire de disposer d'au moins 10Go d'espace de stockage ou d'une Carte SD de 16Go au minimum ( index d'astrométrie non compris)  

**ATTENTION :** Vérifier que les mises à jour automatiques sont désactivées afin qu'elles n'interfèrent pas avec les scripts.

### Etape par étape pour les Raspberry Pi 4b :

1/ Installer la distribution Ubuntu Mate Bionic (18.04 LTS) via Etcher.

https://share.obspm.fr/index.php/s/WowXMAZkHPd3K9j --> Aller dans le dossier base pour l'image de départ pour rpi4b

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


### Documentation pour les Raspberry Pi 3b/3b+/4b :    
http://nafabox.linux-astro.fr/#nafabox

### Documentation to create HotSpot for Raspberry Pi 3b/3b+/4b and X86 System (in french):   


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