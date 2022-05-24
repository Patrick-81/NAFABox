# NAFABox (Nomad Astronomy For All)

Script d'installation pour Créer une NAFABox.

Ces scripts sont compatibles avec les systèmes classiques amd64/x86_64 (Ubuntu).   
Les scripts ont été testés avec Ubuntu Bionic (18.04 LTS) et Ubuntu Focal (20.04 LTS).  
Il est recomandé d'utiliser **Ubuntu Focal (20.04 LTS)**.

Il est nécessaire de disposer d'au moins 10Go d'espace de stockage ( index d'astrométrie non compris)  

**ATTENTION :** Vérifier que les mises à jour automatiques sont désactivées afin qu'elles n'interfèrent pas avec les scripts.


### Pour les systèmes X86_64/Amd64 Ubuntu Linux system :

1/ Installez la distribution via Etcher pour une installation USB.

**Ubuntu Mate** Focal (20.04 LTS) --> conseillé 
http://cdimage.ubuntu.com/ubuntu-mate/releases/20.04/release/ubuntu-mate-20.04.3-desktop-amd64.iso   
ou **Xubuntu** Focal (20.04 LTS):   
http://cdimage.ubuntu.com/xubuntu/releases/20.04/release/xubuntu-20.04.3-desktop-amd64.iso   
ou **Lubuntu** Focal (20.04 LTS) (Pas testé):  
http://cdimage.ubuntu.com/lubuntu/releases/20.04/release/lubuntu-20.04.3-desktop-amd64.iso   
ou **Ubuntu** Focal (20.04 LTS) (Pas testé):  
https://releases.ubuntu.com/20.04.3/ubuntu-20.04.3-desktop-amd64.iso 
ou **Kubuntu** Focal (20.04 LTS) (Pas testé):  
http://cdimage.ubuntu.com/kubuntu/releases/20.04/release/kubuntu-20.04.3-desktop-amd64.iso   
ou **Ubuntu-Budgie** Focal (20.04 LTS) (Pas testé):  
http://cdimage.ubuntu.com/ubuntu-budgie/releases/20.04/release/ubuntu-budgie-20.04.3-desktop-amd64.iso   


Puis démarrer l'image et suivez la procédure d'installation standard.


2/ Télécharger :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
ou  
2bis/ Dans votre home : `git clone https://github.com/Patrick-81/NAFABox.git`

3/ Décompresser le fichier zip ( juste pour 2/)

4/ Ouvrez le dossier ainsi créé

5/ lancer **Pre_Install.sh** dans un terminal (avec un clic droit dans le dossier)

`$ ./Pre_Install.sh` 

Vous pouvez choisir d'installer la langue francaise et le clavier si ce n'est pas déjà fait.

6/ Une fois le script __Pre_Install__ fini, fermer le terminal puis redémarer.

__Si vous avez modifié la langue,__ le systeme vas vous proposer de renomé les dossiers utilisateurs, accepter puis redémarer. A cause du mode de fonctionnement, après le redémarage, il faut suprimer l'ancien dossier correspondant au bureau ( supprimer le dossier Desktop pour un passage d'anglais au français).    
__Attention__ Ne pas supprimer le dossier __Desktop__ si c'est le seul présent.

ouvrir un nouveau terminal.

Lancer une mise a jour :   
`$ sudo apt update`    
`$ sudo apt upgrade -y`    
redémarer

ouvrir un nouveau terminal.    
Lancer __Install.sh__   

`$ ./Install.sh` 

7/ répondez aux questions lorsque vous y êtes invité, et entrez votre mot de passe quand c'est demandé, remplissez les menus si nécessaire.

8/ Quand tout est fini vous pouvez redémarrer.


### Documentation pour le mappage persistant pour les péripheriques serial/usb (en anglais):   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html
