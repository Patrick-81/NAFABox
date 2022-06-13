# Construction d'un image pour RPI4 et RPI3b+ :   

Ce tuto est destiné à vous accompagner afin de mettre en place un système de base avec interface graphique à l'aide de l'image d'Ubuntu Server 

## Téléchargement et parametrage de base :

Pour installer l'image sur votre carte SD utilisez la logiciel fourni pour le Raspberry Pi :
[Raspberry Pi Imager](https://www.raspberrypi.org/software/)   
Téléchargez le puis installez, le il est compatible avec toutes les platformes !

## Installation de la carte SD (min 32Go, version U3/V30) :

Insérer votre carte SD dans votre ordinateur.   

### Sélectionnez "choisissez l'OS" :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_1.JPG)

### Sélectionnez "Other general-purpose OS" :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_2.JPG)

### Sélectionnez "Ubuntu" :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_3.JPG)

### Sélectionnez "Ubuntu Server 22.04 LTS" (version arm64, 64-bit) :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_4.JPG)

### Sélectionnez "Choisissez le Stockage" et selectionnez votre carte SD :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_5.JPG)

### Sélectionnez les options afin de parametrer votre nom d'utilisateur, l'acces SSH, la conection wifi, le type de clavier :   
![select image](https://github.com/Patrick-81/NAFABox/raw/master/doc/rpi_install_6.JPG)


## Install de l'interface graphique et correction :

## (OPTIONNEL) :
### définisez le bon clavier :
Connectez vvous puis lancer la commande suivante : 
`sudo dpkg-reconfigure keyboard-configuration`
### Pour créer un nouvelle utilisateur :
Attention le clavier est en QWERTY par defaut. Sous Linux les mots de passe ne s'affiche pas c'est normal.  
- Connectez vous sur l'utilisateur par defaut :
login : ubuntu
mdp : ubuntu

Il vous sera demendé de définir un nouveau mots de passe.

- Créer un nouvelle utilisateur (nafabox par exemple):
`sudo adduser nafabox`   
- autorisez ce nouvelle utilisateur à ecceder à la commande "sudo" :
`sudo adduser nafabox sudo`   
- redémarez :
`reboot`
- connectez vous au nouvel utilisateur
- Suprimer l'utilisateur par defaut :
`sudo deluser ubuntu`   
- Suprimer les fichier de l'utilisateur par defaut :
`sudo rm -R /home/ubuntu/`

## (Optimisation) :
### Suprimez "cloud-init" pour un démarage plus rapide :

`sudo apt purge cloud-init`   
`sudo rm -rf /etc/cloud/`   
`sudo rm -rf /var/lib/cloud`   

## Installation de la partie graphique :
### mettez à jour le système :
`sudo apt update`  
`sudo apt upgrade`
`reboot`

### installez l'interface graphique : 
__Xubuntu :__ `sudo apt install xubuntu-desktop` --> très léger plutôt joli   
__Kubuntu :__ `sudo apt install kubuntu-desktop` --> moins léger mais très joli   
__Lubuntu :__ `sudo apt install lubuntu-desktop` --> très léger
__Ubuntu Mate :__ `sudo apt install ubuntu-mate-desktop` --> pas testé

### intallez gdm3 (surtout pour Lubuntu et Kubuntu) :
`sudo apt install gdm3`    

### redémarez pour accéder au bureau :
`reboot`

#### éditez gdm3 pour avoir un autologgin
Une fois redémarrez ouvrez un terminal puis lancez les commandes suivantes :   
`sudo nano /etc/gdm3/custom.conf`   
--> enlevez les commantaires de la section autoboot (2 lignes) et replacez l'utilisateur par default (user1) par votre nom d'utilisateur.
`reboot`

### supprimez l'économiseur d'écran (pour xubuntu):

Dans le menu : **Settings**-->**Screensaver** et désactivé Screensaver

### installer complétement la langue (optionel):

Ouvrez le menu et cherchez "langue" et ouvrez le menu de langue. Le système vous proposera d'installer les paquet de langue manquant. Si ce n'est pas le cas, installer la lague voulu et mettez là en première position afin de la définir comme langue par defaut. Appliquez et redémarer.   
Cette étape peut être fait automatiquement via les script NAFABox.
