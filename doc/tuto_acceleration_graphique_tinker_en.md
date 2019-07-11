# Tuto d'installation pour activer l'acceleration graphique sur Tinkerboard :

Cette manipulation est assez experimentale mais permet une nette acceleration de l'interface graphique. Elle donc inutile si vous n'utiliser pas le bureau de la Tinkerboard.

__Attention :__ Stellarium ne fonctionnera plus car l'émulation openGL n'est pas dans une version assez élevé ( OpenGL 3.1).

## Téléchargement du pack :

rendez vous à cette adresse :   
https://forum.armbian.com/topic/7262-rk3288-media-script-tinkerboard/

Télecharger La version "2.0 for bionic desktop"

## Mise en place :

rendez vous dans le dossier de télechargement puis clique droit et enfin "ouvrir un terminal ici".

Lancer les commandes suivante :

`tar xvf media-rk3288_*.tar.xz`   
`cd media-script`   
`sudo apt remove -y libwayland-dev mesa-common-dev`   

## Installation :

Lancer la commande suivante :    
`./media-rk3288.sh`

![GPU](https://github.com/Patrick-81/NAFABox/raw/master/doc/gpu_accel_1.png)   

![GPU](https://github.com/Patrick-81/NAFABox/raw/master/doc/gpu_accel_2.png)   
Lors de l'installation coché bien opencl et opengl

![GPU](https://github.com/Patrick-81/NAFABox/raw/master/doc/gpu_accel_3.png)   
Installer la version experimentale pour plus de performance.

## Ajutement du système :

Afin de ne pas perdre l'affichage des icones ou certains autres problème veuillez desactiver le compositeur.

Pour cela, ouvrez __MATE Tweak__ puis aller dans l'onglet fenêtre et enfin désactiver le compositeur en selectionnant __Marco (sans compositeur)__ dans le Gestionnaire des fenêtres.

![GPU](https://github.com/Patrick-81/NAFABox/raw/master/doc/gpu_accel_4.png)   
*********************
** English version **
*********************
# Installation tutorial to enable graphical acceleration on Tinkerboard:

This manipulation is quite experimental but allows a clear acceleration of the graphical interface. It is useless if you do not use the Tinkerboard desk.

__Caution:__ Stellarium will not work anymore because the openGL emulation is not in a high enough version (OpenGL 3.1).

## Download the pack:

Go to this address:
https://forum.armbian.com/topic/7262-rk3288-media-script-tinkerboard/

Download "2.0 for bionic desktop" version

## Setting up:

Go to the download folder then right click and finally "open a terminal here".

Start the following commands:

`tar xvf media-rk3288_*.tar.xz`   
`cd media-script`   
`sudo apt remove -y libwayland-dev mesa-common-dev`   

## Installation:

Start the following command:
`. / Media-rk3288.sh`

! [GPU](https://github.com/Patrick-81/NAFABox/raw/master/doc/gpu_accel_1.png)

! [GPU](https://github.com/Patrick-81/NAFABox/raw/master/doc/gpu_accel_2.png) 
When installing checked well opencl and opengl

! [GPU](https://github.com/Patrick-81/NAFABox/raw/master/doc/gpu_accel_3.png) 
Install the experimental version for more performance.

## System addition:

In order not to lose the display of icons or some other problem please disable the composer.

To do this, open __MATE Tweak__ then go to the tab window and finally disable the composer by selecting __Marco (without composer)__ in the Window Manager.

! [GPU](https://github.com/Patrick-81/NAFABox/raw/master/doc/gpu_accel_4.png)
