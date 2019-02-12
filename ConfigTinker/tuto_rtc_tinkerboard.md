## Tuto d'installation d'un RTC pour la Tinkerboard et S
---

__source :__ http://nagashur.com/blog/2015/08/31/ds3231-raspberry-pi-rtc-ajouter-une-horloge-temps-reel-i2c-alitest/

Ce tuto est dédié au module RTC à base de DS3132

---
### Configuration de l’I2C

Ce module fonctionne en I2C, il est donc nécessaire de l’activer et de le faire fonctionner. Pour cela, le plus simple est d’exécuter l’utilitaire raspi-config :
	
`sudo armbian-config`

Ensuite, sélectionnez l’option **3 – Interfacing Options**, puis l’option **P4 I2C**, et choisissez YES, OK, YES, et encore OK. Vous pouvez alors faire finish, puis accepter de redémarrer.        

Pour vérifier le fonctionnement de l’ensemble, il faudra installer les programmes python-smbus et i2c-tools :

`sudo apt-get install python-smbus`   
`sudo apt-get install i2c-tools`   

Une fois cela effectué, vous pourrez vérifier que tout fonctionne en tapant la commande suivante :
	
`sudo i2cdetect -y 1`

Si tout à bien fonctionné et que le câblage est bon, vous devriez voir ceci en faisant un **sudo i2cdetect -y 1** :

![Resultat](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/rtc_rpi.png)

---
### Modification du système 

Nous allons modifier 3 fichiers necessaires pour l'activation du RTC externe car la tinkerboard posède déjà un RTC interne ( mais non utilisable car on ne peut pas brancher de pile dessus, son nom : rtc0)

1- modifier le fichier **/lib/udev/hwclock-set**

`sudo nano /lib/udev/hwclock-set`

Commenter les ligne suivante en mettant un **diese** # devant les lignes suivantes :   
`if [ -e /run/systemd/system ] ; then`  
`    exit 0`  
`fi`  

`if [ -e /run/udev/hwclock-set ]; then`  
`    exit 0`  
`fi`  

Pour sortir `Ctrl+q` puis **y** puis `Enter`


2- modifier le fichier **/lib/udev/rules.d/50-udev-default.rules**

`sudo nano /lib/udev/rules.d/50-udev-default.rules`  

Modifier la ligne suivante :   
`SUBSYSTEM=="rtc", KERNEL=="rtc0", SYMLINK+="rtc", OPTIONS+="link_priority=-100"`  
en  
`SUBSYSTEM=="rtc", KERNEL=="rtc1", SYMLINK+="rtc", OPTIONS+="link_priority=-100"`    

Pour sortir `Ctrl+q` puis **y** puis `Enter`

3- modifier le fichier **/﻿lib/udev/rules.d/85-hwclock.rules**

`sudo nano /﻿lib/udev/rules.d/85-hwclock.rules`  

Modifier ou ajouter la ligne suivante :   
`KERNEL=="rtc1", RUN+="/lib/udev/hwclock-set $root/$name"`     

Pour sortir `Ctrl+q` puis **y** puis `Enter`


---
### Utilisation du module

Notre module est détecté, et utilisable. Cependant, nous ne savons pas encore ce qu’il *raconte*. Nous chercherons donc à communiquer avec le module.

Si tout ce que nous avons fait avant a bien fonctionné, nous pouvons alors exécuter la commande suivante :
	
`echo ds3231 0x68 | sudo tee /sys/class/i2c-adapter/i2c-1/new_device`

Cette commande doit “notifier” au système la présence du composant. Dès lors il est possible de consulter l’heure et la date contenue dans le module en faisant un :

`sudo hwclock`

Cela devrait dès lors afficher une date et une heure. Si vous n’avez jamais utilisé le module, celle ci sera probablement incorrecte. On pourra alors la régler.

---
### Définir la date du système depuis internet et l’enregistrer dans le DS3231

Avant tout assurons nous que les données du système sont correctes, en vérifiant la **timezone** (fuseau horaire) :

`sudo dpkg-reconfigure tzdata`

Choisissez bien le bon continent et la bonne zone. Vous pouvez vérifier la date et l’heure du système via la commande  date. Lorsque celle ci est définie correctement, vous pourrez alors écrire la valeur actuelle du système en utilisant la commande suivante :

`sudo hwclock -w`

---
### Configuration du système pour utiliser automatiquement le module RTC DS3231

Nous avons donc pu définir la date et l’heure du DS3231. Voyons maintenant comment configurer le Raspberry pi pour qu’il utilise ce module à chaque démarrage pour définir l’heure.

En effet, si nous redémarrons maintenant, il faudra refaire *echo ds3231 0x68 > /sys/class/i2c-adapter/i2c-1/new_device* avant de pouvoir utiliser le module (sinon le sudo hwclock ne fonctionne pas).

Pour circonvenir à ce problème, nous allons modifier le fichier **/etc/rc.local** via la commande suivante :

`sudo nano /etc/rc.local`

Nous **ajouterons** à ce fichier les deux lignes suivantes **avant** la ligne contenant **exit 0** :

`echo ds3231 0x68 > /sys/class/i2c-adapter/i2c-1/new_device`  
`hwclock -r`  
`hwclock -s`  

On pourra alors désactiver le service fake-hwclock qui tente de reproduire le fonctionnement d’une horloge temps réel quand on en dispose pas, via la commande suivante :
	
`sudo update-rc.d fake-hwclock disable`

Vous pouvez verifier que le rtc a bien été activé en tapant de nouveau la commande **sudo i2cdetect -y 1**. Cette fois ci vous devriez vous apparaitre **UU** à la place de **68**. 

---
### FIN


