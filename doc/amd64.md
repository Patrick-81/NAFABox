# NAFABox (Nomad Astronomy For All)

Script d'installation pour Créer une NAFABox.

Ces scripts sont compatibles avec les systèmes classiques amd64/x86_64 (Ubuntu).   
Les scripts ont été testés avec Ubuntu Xenial (16.04 LTS) et Ubuntu Bionic (18.04 LTS).  
Il est recomandé d'utiliser **Ubuntu Bionic (18.04 LTS)**.

Il est nécessaire de disposer d'au moins 10Go d'espace de stockage ou d'une Carte SD de 16Go au minimum ( index d'astrométrie non compris)  

**ATTENTION :** Vérifier que les mises à jour automatiques sont désactivées afin qu'elles n'interfèrent pas avec les scripts.


### Pour les systèmes X86_64/Amd64 Ubuntu Linux system :

1/ Installez la distribution 

**Ubuntu Mate** Bionic (18.04 LTS) via Etcher pour une installation USB.
http://cdimage.ubuntu.com/ubuntu-mate/releases/18.04/release/ubuntu-mate-18.04.2-desktop-amd64.iso   
ou **Xubuntu** Bionic (18.04 LTS):   
http://cdimage.ubuntu.com/xubuntu/releases/18.04/release/xubuntu-18.04.2-desktop-amd64.iso   
ou **Lubuntu** Bionic (18.04 LTS) (Pas testé):  
http://cdimage.ubuntu.com/lubuntu/releases/18.04/release/lubuntu-18.04.2-desktop-amd64.iso   
ou **Ubuntu** Bionic (18.04 LTS) (Pas testé):  
http://mirrors.phx.ms/ubuntu-cd/18.04.2/ubuntu-18.04.2-desktop-amd64.iso   
ou **Kubuntu** Bionic (18.04 LTS) (Pas testé):  
http://cdimage.ubuntu.com/kubuntu/releases/18.04/release/kubuntu-18.04.2-desktop-amd64.iso   
ou **Ubuntu-Budgie** Bionic (18.04 LTS) (Pas testé):  
http://cdimage.ubuntu.com/ubuntu-budgie/releases/18.04/release/ubuntu-budgie-18.04.2-desktop-amd64.iso   


Puis démarrer l'image et suivez la procédure d'installation standard.


2/ Télécharger :  https://github.com/Patrick-81/NAFABox/archive/master.zip  
ou  
2bis/ Dans votre home : `git clone https://github.com/Patrick-81/NAFABox.git`

3/ Décompresser le fichier zip ( juste pour 2/)

4/ Ouvrez le dossier ainsi créé

5/ lancer **Pre_Install.sh** dans un terminal (avec un clic droit dans le dossier)

`$ ./Pre_Install.sh` 

Vous pouvez choisir d'installer la langue francaise et le clavier si ce n'est pas déjà fait.

6/ Une fois le script Pre_Install fini, __redémarer__ puis ouvrer un nouveau terminal. 

Lancer **Install.sh**    

`$ ./Install.sh` 

7/ répondez aux questions lorsque vous y êtes invité, et entrez votre mot de passe quand c'est demandé, remplissez les menus si nécessaire.

8/ Quand tout est fini vous pouvez redémarrer.


### Documentation pour le mappage persistant pour les péripheriques serial/usb (en anglais):   
https://indilib.org/support/tutorials/157-persistent-serial-port-mapping.html
