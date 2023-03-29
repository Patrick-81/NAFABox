# NAFABox (Nomad Astronomy For All)

Tuto d'installation pour Créer une NAFABox.

Les Scripts sont exclusivement dédiés à une architecture de type Ubuntu (compatible `apt` et `add-apt-repository`)

Ces scripts sont compatibles avec le __Raspberry Pi 4B__ (Ubuntu Server), la __NanoPi-M4__ (Armbian), les __cartes compatibles Armbian__ et les systèmes classiques __amd64/x86_64__ (Xubuntu, Ubuntu Mate,...).   
Les scripts ont été testés avec Ubuntu Focal (20.04 LTS) et Ubuntu Jammy (22.04 LTS).  

Il est recommandé d'utiliser **Ubuntu Jammy (22.04 LTS)** (ou Focal si Jammy n'est pas disponible).

Il est nécessaire de disposer d'au moins 10Go d'espace de stockage (Disque Dur<eMMC<SSD) ou d'une Carte SD de 32Go au minimum ( index d'astrométrie non compris)  

**ATTENTION :** Vérifier que les mises à jour automatiques sont désactivées afin qu'elles n'interfèrent pas avec les scripts.
[Tuto pour désactiver les mises à jour automatique](https://github.com/Patrick-81/NAFABox/blob/master/doc/update_ubuntu.md)
[Liste des cartes SD conseillé et testé](https://github.com/Patrick-81/NAFABox/blob/master/doc/SD_card.md)

#### Pour Raspberry Pi 4B (4/8Go) / NanoPi-M4 / Autre carte Armbian (armv8/aarch64/arm64) :     
[TUTO pour SBC (Single Board Computer)](https://github.com/Patrick-81/NAFABox/blob/master/doc/SBC.md)    

#### Pour un ordinateur/carte amd64/x86_64 :    
[TUTO pour Ordinateur fixe ou Portable](https://github.com/Patrick-81/NAFABox/blob/master/doc/amd64.md)     


__Lien utile :__

- Page Web NAFABox : IP (:80)
- IndiWebManager : IP:8624
- BrowsePy : IP:8180
- X11VNC : IP:5900
- TightVNC : IP:5901
- NoVNC : IP:5899
- WebDAV : IP:443
- NoMachine : IP:5000
- Cockpit : IP:9090
- Apache2 : IP:8080 (au lieu de 80)


### Liste des logiciels de la NAFABox :   
https://github.com/Patrick-81/NAFABox/blob/master/doc/Software.md

## __IMPORTANT__ : NAFABox Bug et Debug connus :
https://github.com/Patrick-81/NAFABox/blob/master/doc/BUG_and_DEBUG_list.md
