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

![GPU](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/gpu_accel_1.png)   

![GPU](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/gpu_accel_2.png)   
Lors de l'installation coché bien opencl et opengl

![GPU](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/gpu_accel_3.png)   
Installer la version experimentale pour plus de performance.

## Ajutement du système :

Afin de ne pas perdre l'affichage des icones ou certains autres problème veuillez desactiver le compositeur.

Pour cela, ouvrez __MATE Tweak__ puis aller dans l'onglet fenêtre et enfin désactiver le compositeur en selectionnant __Marco (sans compositeur)__ dans le Gestionnaire des fenêtres.

![GPU](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/gpu_accel_4.png)   
