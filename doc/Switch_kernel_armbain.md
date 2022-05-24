# Changement de version du kernel sur Armbian (passer de Next à Default)

Il existe 3 version de Armbian Ubuntu :
- la version stable (5.10.xxxx) appeler version "current" : Focal 20.04.x
- la version de développement (5.12.xx ), appelés version "edge" : Hirsute 21.04.x
- la version de test (>5.12) appelé version "unstable/nightly"

Afin de passer du Kernel default au kernel next ou inversement, 2 techniques :

1/ Refaire l'installation de la nafabox en changant d'image de dépard (NanoPi-M4 par exemple):

https://redirect.armbian.com/nanopim4/Focal_current_xfce    
https://redirect.armbian.com/nanopim4/Hirsute_edge_xfce

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
