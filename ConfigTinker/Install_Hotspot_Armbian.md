# Création d'un Hotspot pour la Tinkerboad et autre carte sous Armbian

- Connecter la Tinkerboard munie de la carte µSD sur laquelle NAFABox est déjà installé au réseau internet via le câble éthernet.
- Connecter écran, clavier et  souris.

Opérations préalables, un peu de ménage :

- Ouvrir un terminal et tapez dans le terminal   
`sudo systemctl stop hotspotawake.service`

- puis   
`sudo systemctl disable hotspotawake.service`  

- enfin   
`sudo rm /etc/NetworkManager/system-connections/*`  
          
C’est tout pour le ménage.


Passons à la création du hotspot :

- Ouvrir un terminal   
`CTR+Alt+T`

- S’assurer que armbian-config est bien installé.  
`sudo apt install armbian-config`

- Dans le même terminal :  
`sudo armbian-config`

![terminal](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/armbian_conf_prompt.png)

- Choisir network   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/armbian_config_1.png)

- Choisir le périphérique wifi   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/armbian_config_2.png)

- Choisir créer le hotspot   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/armbian_config_3.png)

- Laisser les opérations se dérouler jusqu’à l’apparition de nouveau du panneau suivant :  

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/armbian_config_4.png)
 
- Choisissez wlan0   

Laisser les opérations se dérouler jusqu’à l’apparition de nouveau du panneau suivant :   

![armbian-config](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/armbian_config_5.png)

- C’est fini pour l’installation du hotspot

## Modification du Hotspot :

Maintenant il faut éditer le fichier **hostapd.conf** afin de changer le nom du hotspot et le mots de passe. Vous utilisez nano si vous connaissez ou pluma comme éditeur.

![terminal](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/hotspot_prompt_1.png)

Si vous le voulez vous pouvez changer le SSID. Moi j’ai choisit NAFABox.   
Après, veillez commenter avec un **#** en début de ligne.   

![terminal](https://github.com/Patrick-81/NAFABox/raw/master/ConfigTinker/hotspot_prompt_2.png)

Pour ne pas avoir de mots de passe vous pouvez commenter les lignes commenté au dessus (dans l'image).
Pour changer le mot de passe c'est la ligne **wpa_passphrare**.

Sauvegardez et redémarrez la Tinkerboard.

### FIN
