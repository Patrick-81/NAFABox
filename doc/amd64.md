# NAFABox (Nomad Astronomy For All)

Script d'installation pour Créer une NAFABox.

Ces scripts sont compatibles avec les systèmes classiques amd64/x86_64 (type Ubuntu, sauf Debian).   
Les scripts ont été testés avec Ubuntu Focal (20.04 LTS) et Ubuntu Jammy (22.04 LTS).  
Il est recomandé d'utiliser **Ubuntu Jammy (22.04 LTS)**.

Il est nécessaire de disposer d'au moins 10Go d'espace de stockage ou d'une Carte SD de 16Go au minimum ( index d'astrométrie non compris)  

**ATTENTION :** Vérifier que les mises à jour automatiques sont désactivées afin qu'elles n'interfèrent pas avec les scripts.


### Pour les systèmes X86_64/Amd64 Ubuntu Linux system :

__1-__ Installez la distribution via Etcher pour une installation USB.
  
ou **Xubuntu** Jammy (22.04 LTS): --> conseillé   
http://cdimage.ubuntu.com/xubuntu/releases/22.04/release/xubuntu-22.04-desktop-amd64.iso   
**Ubuntu Mate** Jammy (22.04 LTS)    
http://cdimage.ubuntu.com/ubuntu-mate/releases/22.04/release/ubuntu-mate-22.04-desktop-amd64.iso    
ou **Kubuntu** Jammy (22.04 LTS):   
http://cdimage.ubuntu.com/kubuntu/releases/22.04/release/kubuntu-22.04-desktop-amd64.iso    
ou **Lubuntu** Jammy (22.04 LTS) (Pas testé):   
http://cdimage.ubuntu.com/lubuntu/releases/22.04/release/lubuntu-22.04-desktop-amd64.iso   
ou **Ubuntu** Jammy (22.04 LTS) (Pas testé):    
https://ubuntu.univ-nantes.fr/ubuntu-cd/22.04/ubuntu-22.04-desktop-amd64.iso   
ou **Ubuntu-Budgie** Jammy (22.04 LTS) (Pas testé):    
http://cdimage.ubuntu.com/ubuntu-budgie/releases/22.04/release/ubuntu-budgie-22.04-desktop-amd64.iso    


Puis démarrer l'image et suivez la procédure d'installation standard.


**ATTENTION** Il faut redémarer l'ordinateur avant toute manipulation     

__2-__ Dans un terminal pour redéfinir votre clavier si besoin : `sudo dpkg-reconfigure keyboard-configuration` puis redémarez   

__3-__ Télécharger :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
ou  
__3bis-__ Dans votre home `cd ~`:   
`sudo apt install git`   
`git clone https://github.com/Patrick-81/NAFABox.git`

__4-__ Décompresser le fichier zip ( juste pour 2/)

__5-__ Ouvrez le dossier ainsi créé

__6-__ lancer **Pre_Install.sh** dans un terminal (avec un clic droit dans le dossier)

`$ ./Pre_Install.sh` 
( Pour un clavier Francais AZERTY : `:!Pre°Instqll:sh` ) 

Vous pouvez choisir d'installer la langue francaise si ce n'est pas déjà fait.

__7-__ Une fois le script __Pre_Install__ fini, fermer le terminal puis redémarer.

__Si vous avez modifié la langue,__ le systeme vas vous proposer de renomé les dossiers utilisateurs, accepter puis redémarer. A cause du mode de fonctionnement, après le redémarage, il faut suprimer l'ancien dossier correspondant au bureau ( supprimer le dossier __Desktop__ pour un passage d'anglais au français).    
__Attention__ Ne pas supprimer le dossier __Desktop__ si c'est le seul présent.

ouvrir un nouveau terminal.

Lancer une mise a jour :    
`$ sudo apt update`      
`$ sudo apt upgrade -y`    
redémarer

ouvrir un nouveau terminal.    
Lancer __Install.sh__

`$ ./Install.sh` 

__8-__ répondez aux questions lorsque vous y êtes invité, et entrez votre mot de passe quand c'est demandé, remplissez les menus si nécessaire.

__9-__ Quand tout est fini vous devez redémarrer.


### Documentation pour le mappage persistant pour les péripheriques serial/usb (en anglais):   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html
