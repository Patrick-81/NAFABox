# Création/Edition/Suppression d'un Hotspot pour la Tinkerboad et autre carte sous Armbian

- Connecter la Tinkerboard munie de la carte µSD sur laquelle NAFABox est déjà installé au réseau internet via le câble éthernet.
- Connecter écran, clavier et  souris.

Sur Armbian Config, il faudra utiliser les touche directionnel ainsi que la touche "Tab" afin de se déplacer dans les menus

Armbian Config est aussi utilisable en SSH sans interfaces graphiques.

L'addresse IPde la NAFABox en mode HotSpot est : **172.24.1.1**

## Correction préalable :

### Suppresion du service hotspotawake
- Ouvrir un terminal et tapez dans le terminal afin de l'arrêter    
`sudo systemctl stop hotspotawake.service`

- puis ceci afin de désactiver    
`sudo systemctl disable hotspotawake.service`  

Si vous êtes déjà connecté en wifi, l'option hotspot ne sera pas accessible. Vous devez d'abbord vous déconnecter via l'interface graphique ou via Armbian config :

![terminal](https://github.com/Patrick-81/NAFABox/raw/master/doc/wifi_manage1.png)    

Désactiver toute les connection wifi.

Pour supprimer toute connection wifi enregistrer :

`sudo rm /etc/NetworkManager/system-connections/*`  
`sudo service NetworkManager restart`


## Création du Hotspot :

- Ouvrir un terminal   
`CTR+Alt+T`

- S’assurer que armbian-config est bien installé.  
`sudo apt install armbian-config`

- Dans le même terminal (ou via l'interface graphique) :  
`sudo armbian-config`

![terminal](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_conf_prompt.png)

- Choisir network   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_config_1.png)

- Choisir le périphérique wifi   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_config_2.png)

- Choisir créer le hotspot   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_config_3.png)

- Laisser les opérations se dérouler jusqu’à l’apparition de nouveau du panneau suivant :  

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_config_4.png)
 
- Choisissez wlan0   

Laisser les opérations se dérouler jusqu’à l’apparition de nouveau du panneau suivant :   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_config_5.png)

- C’est fini pour l’installation du hotspot

## Modification du Hotspot :

3 Techniques existe afin de modifier le hotspot :
- Mode basique (Débutant)
- Mode advanced (Moyen) --> mode pour supprimer la sécurité du hotspot (non conseillé)
- Mode manuel (Confirmé)

### Mode Basique ( débutant) :

- Démarer Armbian config en mode terminal ou graphique 

![terminal](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_conf_prompt.png)

- Choisir network   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_config_1.png)

- Choisir le périphérique wifi   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_config_2.png)

- Selectionner Hotspot (qui doit avoir l'option manage maintenant, comme pour la modification)

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/select_hotspot.png)

- selectionner Edit pour éditer

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/hotspot_edit1.png)

- Selectionner Basic pour modifier le nom (SSID) et/ou le mots de passe

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/hotspot_edit2.png)

- Modifier le SSID et le mot de passe à votre convenance

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/hotspot_edit3.png)

Puis accepter pour enregistrer

### Mode Advanced ( Moyen) :

- Démarer Armbian config en mode terminal ou graphique 

![terminal](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_conf_prompt.png)

- Choisir network   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_config_1.png)

- Choisir le périphérique wifi   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_config_2.png)

- Selectionner Hotspot (qui doit avoir l'option manage maintenant, comme pour la modification)

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/select_hotspot.png)

- selectionner Edit pour éditer

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/hotspot_edit1.png)

- Selectionner Advanced pour modifier le hotspot en profondeur

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/hotspot_adv1.png)

- Modifier ce que vous voulez ( commenter avec un **#** en début de ligne au lieu de supprimer)

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/hotspot_adv2.png)

Puis save pour enregistrer

Pour supprimer le mot de passe pour le hotspot vous pouvez commenter les lignes suivantes :
**wpa=2 ; wpa_psk=... ; wpa_passphrase=... ; wpa_key_mgmt=WPA-PSK ; wpa_pairwise=TKIP ; rsn_pairwise=CCMP ; auth_algs=1**

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/hotspot_edit_nopass.png)

### Mode Manuel ( Confirmé ) :

Maintenant il faut éditer le fichier **hostapd.conf** afin de changer le nom du hotspot et le mots de passe. Vous utilisez nano si vous connaissez ou pluma comme éditeur.

![terminal](https://github.com/Patrick-81/NAFABox/raw/master/doc/hotspot_prompt_1.png)

Si vous le voulez vous pouvez changer le SSID. Moi j’ai choisit NAFABox.   
Après, veillez commenter avec un **#** en début de ligne.   

![terminal](https://github.com/Patrick-81/NAFABox/raw/master/doc/hotspot_prompt_2.png)

Pour ne pas avoir de mots de passe vous pouvez commenter les lignes commenté au dessus (dans l'image).
Pour changer le mot de passe c'est la ligne **wpa_passphrare**.

Sauvegardez et redémarrez la Tinkerboard.

## Arret du Hotspot :

**Attention:** ne supprimez pas le fichier hostapd pour arreter le hotspot.

- Démarer Armbian config en mode terminal ou graphique 

![terminal](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_conf_prompt.png)

- Choisir network   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_config_1.png)

- Choisir le périphérique wifi   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/armbian_config_2.png)

- Sélectionnez Hotspot (qui doit avoir l'option manage maintenant, comme pour la modification)

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/select_hotspot.png)

- Sélectionnez Stop puis attendez

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/doc/hotspot_stop.png)

Vous pouvez mainetenant quitter et utiliser le reseaux wifi normalement

### FIN
