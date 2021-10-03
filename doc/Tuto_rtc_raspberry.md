## Tuto d'installation d'un RTC pour Raspberry Pi 3b ou 3b+
---

__source :__ http://nagashur.com/blog/2015/08/31/ds3231-raspberry-pi-rtc-ajouter-une-horloge-temps-reel-i2c-alitest/

Ce tuto est dédié au module RTC à base de DS3132 (peut marché aussi avec le DS1307)

---
### Configuration de l’I2C

Ce module fonctionne en I2C, il est donc nécessaire de l’activer et de le faire fonctionner. Pour cela, il faut activer l'I2C :   

`sudo pluma /boot/firmware/syscfg.txt`   

Modifiez le fichier afin d'avoir cette ligne sur **on** et non commenté :   

`dtparam=i2c_arm=on`   


Pour vérifier le fonctionnement de l’ensemble, il faudra installer les programmes python-smbus et i2c-tools :

`sudo apt-get install python3-smbus`   
`sudo apt-get install i2c-tools`   

Une fois cela effectué, vous pourrez vérifier que tout fonctionne en tapant la commande suivante :
	
`i2cdetect -y 1`

__Attention :__ Les premiers modèles de Raspberry pi (très anciens) devront recevoir la commande sudo i2cdetect -y 0 à la place.

Si tout à bien fonctionné et que le câblage est bon, vous devriez voir ceci en faisant un **sudo i2cdetect -y 1** :

![Resultat](https://github.com/Patrick-81/NAFABox/raw/master/doc/rtc_rpi.png)

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

**Attention :** Si il n'y a pas de fichier rc.local, il faut le créer et activer le service : https://www.linuxbabe.com/linux-server/how-to-enable-etcrc-local-with-systemd

Nous **ajouterons** à ce fichier les deux lignes suivantes **avant** la ligne contenant **exit 0** :

`echo ds3231 0x68 > /sys/class/i2c-adapter/i2c-1/new_device`  
`hwclock -r`  
`hwclock -s`  

On pourra alors désactiver le service fake-hwclock qui tente de reproduire le fonctionnement d’une horloge temps réel quand on en dispose pas, via la commande suivante :
	
`sudo update-rc.d fake-hwclock disable`

Vous pouvez verifier que le rtc a bien été activé en tapant de nouveau la commande **sudo i2cdetect -y 1**. Cette fois ci vous devriez vous apparaitre **UU** à la place de **68**.
La deviation d'un ds3132 est très faible donc il n'est pas necessaire de le resynchroniser souvent.

---
### FIN


