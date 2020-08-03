
# BUG and DEBUG

### 1/ for Nomachine keyboard bug (fixed in 3.2.1):

- Une fois connecté via NoMachine pour avoir le clavier en francais vous pouvez lancer le script reconfig_keyboard    
- If in NoMachine, your keyboard is not in english need run reconfig_keyboard script    

### 2/ No desktop bug ( or partial desktop bug or white screen in NoMachine):

- Si vous démarrez et qu'il n'y plus d'icone sur le bureau et que le clique droit ne marche plus, essayer F5 ou redémarer    
- If you start and there is no icon on the desktop and the right click no longer works, try F5 or restart     

### 3/ Hotspot option does not appear in armbian-config :

- Déconnectez vous du reseaux wifi sur lequel vous êtes connecté à l'aide de armbian-config ou du bureau puis redémarer armbian-config     
- (bis) lancer la commande suivante, qui supprime toute les connection wifi : `sudo rm /etc/NetworkManager/system-connections/*`    

- Disconnect from the wifi networks on which you are connected using armbian-config or the desktop then restart armbian-config     
- (bis) launch the following command, which removes all wifi connections: `sudo rm /etc/NetworkManager/system-connections/*`    

### 4/ Partial desktop bug or white screen in NoMachine :

- Lancer **setres** et selectionner une résolution voulu puis mettez à jour le bureau (F5)   
- Run **setres** and update Desktop (F5)   

### 5/ bluetooth download folder error : 

- Lancer un Terminal puis tapez les commandes suivantes :
    `gsettings get org.blueman.transfer shared-path`  --> pour savoir où pointe blueman
    `gsettings set org.blueman.transfer shared-path '/home/toto'`  --> pour faire pointer blueman vers '/home/toto'
- Start a Terminal and type the following commands:
     `gsettings get org.blueman.transfer shared-path` --> to find out where blueman points
     `gsettings set org.blueman.transfer shared-path '/home/toto'` --> to point blueman to '/home/toto'
     
### 6/ Ethernet not support on RPI4 :    
https://askubuntu.com/questions/1189146/raspberry-pi-4b-ubutnu-19-10-wired-network-unmanaged    
- Lancer un terminal puis :
    `ls /etc/netplan/50-cloud-init.yaml`
Si il y a pas de resulat alors devez le créer :   
- dans un terminal :    
    `sudo netplan generate`    
    `sudo netplan apply`   
Si il y a un resultat ou que vous avez générer le fichier :    
- dans un terminal :    
    `sudo nano /etc/netplan/50-cloud-init.yaml`    
    
Assurer vous que le contenue du fichier soit le suivant :    
`# This file is generated from information provided by`   
`# the datasource.  Changes to it will not persist across an instance`   
`# To disable cloud-init's network configuration capabilities, write a file`   
`# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following`   
`# network: {config: disabled}`   
`network:`   
`    renderer: NetworkManager`   
`    ethernets:`   
`        eth0:`   
`            dhcp4: true`   
`    version: 2`   
    
Pour sortir et sauvegarder __CTRL+X__ puis tapez "y" ou "o" puis __ENTER__.

### 7/ For Wifi Instability on RPI4 :  
Il faut désactiver le mode économie d'énergie du wifi.
- dans un terminal :   
    `sudo iw wlan0 set power_save off`    
    `sudo apt purge gnome-power-manager`    
    `sudo apt autoremove`   

### X/ For New bug :

- poster une "Issue" sur github et fournissez le fichier nafabox.log (dans .../NAFABox/ConfigTinker/ )    
- open "Issue" in github and add nafabox.log file (in .../NAFABox/ConfigTinker/ )   
