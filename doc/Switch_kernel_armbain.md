# Changement de version du kernel sur Armbian (passer de Next à Default)

Il existe 3 version de Armbian :
- la version stable (4.4.xxxx) appeler version "default"
- la version de développement (4.19.xx qui ontient toute les dernière mise à jour, appeler version "next"
- la version de teste (4.20.xx, 5.0.xx, ...) appelé version "nightly"

Afin de passer du Kernel default au kernel next ou inversement, 2 techniques :

1/ Refaire l'installation de la nafabox en changant d'image de dépard :

https://dl.armbian.com/tinkerboard/Ubuntu_bionic_next_desktop.7z
https://dl.armbian.com/tinkerboard/Ubuntu_bionic_default_desktop.7z

2/ changer de kernel via Armbian config :

Pour cela, lancer Armbian config ( ou via l'interface graphique):
 
![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_conf_prompt.png)    

Puis choisisez **system** :    
![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_system.png)   

2 possibilités :

- l'interface devient rouge, alors c'est que la version du kernel est freezer il faudra le **defreezer** (voir partie defreezer)    
![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/defreeze_1.png)   

- l'interface devient bleu, vous pouvez directement aller à l'étape suivante.
![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/freeze_1.png)     

Choisisez **other** :    
![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/switch_kernel_1.png)   

Cochez la case à l'aide de la barre espace puis validez :   
![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/switch_kernel_2.png)   

choisisez la version voulu 

(version next ) :    
![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/switch_kernel_next.png)   

(version default) :   
![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/switch_kernel_default.png)   

La version nightly est déconseillé.

L'utilitaire vous proposera de redémarrer acceptez ou redémarrez vous même.

## optionnel mais conseillé surtout en version next (et nightly)

Il est préférable de freezer la version du kernel afin de ne pas avoir de mauvaise surprise lors d'une mise à jour de celui ci. Il peut arriver qu'une mise à jour apporte des bugs ( trés trés rare dans default).

Pour cela, retourner dans le menu **system** de Armbian Config.

Puis lancez l'option **freeze** :    
![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/freeze_1.png)    

une fois fait, l'interface devient rouge et vous ne pourrai plus mettre à jour votre kernel sans defreezer.

## Defreezer :

Pour cela, retourner dans le menu **system** de Armbian Config.

Puis lancez l'option **defreeze** :    
![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/defreeze_1.png)    

Confirmez :    
![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/defreeze_2.png)    

une fois fait, l'interface devient bleu et vous pourrai mettre à jour votre kernel.
