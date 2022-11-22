# Construction d'une image pour RPI4 et RPI3b+ :   

Ce tuto est destiné à vous accompagner afin de mettre en place un système de base doté d’une interface graphique, à l'aide de l'image d'Ubuntu Server. 

## Téléchargement et paramétrage de base :

Pour installer l'image sur votre carte SD, utilisez le logiciel fourni pour le Raspberry Pi :
[Raspberry Pi Imager](https://www.raspberrypi.org/software/)   
Téléchargez-le, puis installez-le. Il est compatible avec toutes les plateformes !

## Installation de la carte SD (minimum 32Go, version U3/V30) :

Insérez votre carte SD dans votre ordinateur.   

### Sélectionnez « choisissez l'OS » :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_1.JPG)

### Sélectionnez « Other general-purpose OS » :   
![select general OS](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_2.JPG)

### Sélectionnez « Ubuntu » :   
![select ubuntu](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_3.JPG)

### Sélectionnez « Ubuntu Server 22.04.1 LTS » (version arm64, 64-bit) :   
![select server 22.04](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_4.JPG)

### Sélectionnez « Choisissez le Stockage », puis votre carte SD :   
![select SD](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_5.JPG)

### Sélectionnez les bonnes options afin de paramétrer votre nom d'utilisateur, l'accès SSH, la connexion wifi et le type de clavier :   
![select param](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_6.JPG)


- Insérez la carte SD dans le Raspberry Pi.    
- Branchez le câble réseau (ou utilisez la connexion wifi paramétrée précédemment);   
- Branchez l'écran.
- Branchez la souris et le clavier.
- Branchez l'alimentation.

## Installation :

### (OPTIONNEL) si pas parametrer dans RPI imager :
#### Choisissez le bon clavier :
Connectez-vous, puis tapez la commande suivante : 
`sudo dpkg-reconfigure keyboard-configuration`
#### Pour créer un nouvel utilisateur :
Attention : le clavier est en QWERTY par défaut. Sous Linux, les mots de passe ne s'affichent pas et c'est normal.  
- Connectez-vous avec l'utilisateur par défaut :

login : `ubuntu`   
mot de passe : `ubuntu`

Il vous sera demandé de définir un nouveau mot de passe.

- Créez un nouveau utilisateur (en l’appelant nafa par exemple):
`sudo adduser nafa`   
- Autorisez ce nouvel utilisateur à exécuter la commande « sudo » :
`sudo adduser nafa sudo`   
- Redémarez :
`reboot`
- Connectez-vous avec le nouvel utilisateur
- Supprimez l'utilisateur par défaut :
`sudo deluser ubuntu`   
- Supprimez les fichiers lui appartenant :
`sudo rm -R /home/ubuntu/`

### (Optimisation) :
#### Supprimez « cloud-init » pour un démarrage plus rapide :

`sudo apt purge cloud-init`   
`sudo rm -rf /etc/cloud/`   
`sudo rm -rf /var/lib/cloud`   

#### Supprimez « needrestart » :
`sudo apt-get purge needrestart`

## Installation de la partie graphique :
### Mettez à jour le système :
`sudo apt update`  
`sudo apt upgrade`   
`reboot`

### Installez les pilotes graphiques :
`sudo apt install mesa-* vulkan-*`

### Installez l'interface graphique : 
__Attention :__ cette partie peut durer plus de 30min.

__Xubuntu :__ `sudo apt install xubuntu-desktop` --> très léger plutôt joli   
__Kubuntu :__ `sudo apt install kubuntu-desktop` --> moins léger mais très joli   
__Lubuntu :__ `sudo apt install lubuntu-desktop` --> très léger   
__Ubuntu Mate :__ `sudo apt install ubuntu-mate-desktop` --> pas testé

### Intallez gdm3 (surtout pour Lubuntu et Kubuntu) :
Il faut installer un display manger leger pour plus de simplicité ( sddm pour kubuntu et lubuntu bug sur ubuntu server)   
`sudo apt install gdm3`  

### Intallez firefox :
Je vous conseil d'installer firefox car il n'y aura pas de navigateur par défaut :   
`sudo apt install firefox`  

### Redémarrez pour accéder au bureau :
`reboot`

### Démarer sur Xubuntu ( ou Kubuntu, Lubuntu, Mate)
Au premier redémarrage une fois votre utilisateur sélectionné mais avant le mot de passe il faudra sélectionner l'interface graphique que vous souhaitez démarrer.   
Sélectionner l'engrenage en bas à droite et selectionner __Xubuntu__ (si vous avez installé Xubuntu).   

![select xubuntu session](https://github.com/Patrick-81/NAFABox/raw/master/doc/select_interface.jpg)   

Puis vous pouvez rentrer votre mot de passe et vous connecter.   


#### Modifiez le fichier gdm3 pour vous connecter automatiquement :
Après avoir redémarré, ouvrez un terminal puis tapez les commandes suivantes :   
`sudo nano /etc/gdm3/custom.conf`   
--> enlevez les commentaires de la section « autoboot » (2 lignes) et replacez l'utilisateur par default (user1) par votre propre nom d'utilisateur.   
![edit_gdm3](https://github.com/Patrick-81/NAFABox/raw/master/doc/edit_gdm3.jpg)    
Pour quitter et enregistrer : CTRL+X --> Y --> ENTER    
`reboot`

### Supprimez l'économiseur d'écran (pour xubuntu):

Dans le menu : **Settings**-->**Screensaver** et désactivez Screensaver

### Installez votre langue (optionnel) :
[tuto langue](https://github.com/Patrick-81/NAFABox/blob/master/doc/language.md)   

Cette étape peut être faite automatiquement via les scripts NAFABox (seulement pour le francais).
