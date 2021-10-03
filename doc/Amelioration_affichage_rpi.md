# Tuto pour améliorer la fluidité d'affichage d'un raspberry pi :

Les Raspberry PI ne réagisse pas comme un ordinateur standard pour sa configuration.

Pour une utilisation nomade (sans écran), il est necessaire d'augmenter la mémoire
du GPU afin de rendre l'affichage fluide sur **VNC/NoMachine** ou sur un écran classique.

Sur les Raspberry Pi pour augmenter la taille de la mémoire pour le GPU, 
il faut modifier le fichier de configuration.

## Modification du fichier config.txt :

Le fichier **config.txt** contient toutes les options de configuration du raspberry.
Pour trouver ce fichier rien ne plus simple, 2 choix s'offre a vous :

### Via le terminal sur le raspberry :

Vous pouvez taper (sur ubuntu mate): `sudo pluma /boot/firmware/config.txt`

### Via un autre ordinateur :

Branchez la carte SD à l'ordinateur et acceder à la partition/disque **PI_BOOT**.
Il ne vous reste plus qu'à ouvrir le fichier **usercfg.txt**.

-----------------------

Nous allons maintenant modifier le fichier **usercfg.txt**. 
Pour cela il vas faloir déjà verifier que la ligne permetant de modifier
la taille de la mémoire GPU n'est pas déjà présente dans le fichier.

La ligne à repérer est la suivante ( avec **..** = une valeur quelconque):   
`gpu_mem=..`
   
Si vous trouvez cette ligne il faudra la supprimer ou la commenter pour plus de 
prudence ( rajouter seulement un `#` devant la ligne que vous shouaitez commenter).

Une fois fait il ne vous reste plus qu'à ajouter la ligne suivante à la fin du fichier :   
`gpu_mem=128`

Il est necessaire d'avoir au moins 128Mo de mémoire GPU afin d'assurer une navigation fluide.
Vous pouvez mettre au maximum 192Mo (PI1A+,PIA) ou 448Mo (zero,zeroW,New_PI1A+,PI1B+,PIB) 
ou 944Mo (PI2B,PI3B,PI3B+,PI3A+) et au minimum 16Mo.

Pour le RPI4B le fonctionnement est différent, l'allocation est dynamique. Il faut rester sur 128.

Une fois la lignes ajouté, n'oubliez pas de sauvegarder puis redémarer (ou remettre la carte SD)

**Pour aller plus loin (en anglais):** https://www.raspberrypi.org/documentation/configuration/config-txt/memory.md

**Attention**   
Sur la version 20.04.x d'Ubuntu Mate ce paramètre est par defaut à 128.   
A partir de la version 20.04.x il ne faut plus modifier le fichier **config.txt** mais le **usercfg.txt**