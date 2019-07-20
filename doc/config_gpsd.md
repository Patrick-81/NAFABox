# configuration d'un GPS pour INDI :

Il existe 4 possibilité pour brancher un source de temps et localisation à votre ordinateur.

Pour que votre module soit compatible il faut qu'il soit compatible __NMEA__.

Il faut aussi avoir installer GPSD préalablement ( dans la partie Kstars des scripts)

#### Via USB :

Vous n'avez rien a faire en théorie gpsd trouvera tout seul votre gps usb
Sur indi il faudra utiliser le driver auxiliaire GPSD.
#### Via la Monture :

Vous avez un gps brancher sur votre monture. Si le driveur est compatible il pourrai transmettre le temps et la possition via le cable de votre monture.

#### Via un smartphone Android/IOS:

Si votre smartphone est sur android/IOS et qu'il est équipé d'un GPS il peut transmettre la position et le temps à INDI.


Pour Android, vous pouvez installer l'application (shareGPS)[https://play.google.com/store/apps/details?id=com.jillybunch.shareGPS&hl=en]


Pour IOS, vous pouvez installer l'application (GPS 2 IP)[https://itunes.apple.com/us/app/gps-2-ip/id408625926?mt=8]

Une fois votre telephone connecté au même reseaux que votre rpi/tinkerboard il ne vous reste plus qu'à utiliser le driver Auxiliaire GPSNMEA


#### Via un GPS Serie ou hardware NAFABox

Il faut indiquer à GPSD où ce trouve votre GPS.   
Pour ca connecte votre GPS.

Puis arretez GPSD :

`sudo systemctl stop gpsd.service`  
`sudo systemctl disable gpsd.service`  
On reboot ...

Maintenant il faut chercher le GPS. Débranchez tout le reste.

`ls /dev/tty*`

Vous devriez avoir des noms en ttyS0, ttyS1, ...
ou ttyAM0, ttyAM1, ...

Pour identifier votre GPS il ne vous reste plus qu'à tous les essayer à l'aide de la commande :

`cat /dev/ttyXXX`  avec XXX le nom du port à essayer.

Vous devriez voir apparaitre sur un des port une serie de ligne qui s'enchéne.

Si ce n'est pas le cas verifiez que les connecteur TX et RX sont bien positionné.

Une fois le port identifié il faut l'indiqué à GPSD :

`sudo nano /etc/default/gpsd`


vous devriez vous voir quelque chose de ce style apparaitre :

`# Default settings for the gpsd init script and the hotplug wrapper.`  

`# Start the gpsd daemon automatically at boot time`  
`START_DAEMON="true"`

`# Use USB hotplugging to add new USB devices automatically to the daemon`  
`USBAUTO="true"`

`# Devices gpsd should collect to at boot time.`  
`# They need to be read/writeable, either by user gpsd or the group dialout.`  
`DEVICES="/dev/ttyS4"`

`# Other options you want to pass to gpsd`  
`GPSD_OPTIONS=""`

Dans cette exemple j'ai indiqué le port **/dev/ttyS4**.
Pour enregistrer sur nano : `CTRL+x` puis `o` puis `enter`

Une fois fait il ne vous reste plus qu'à réactiver GPSD.
 
`sudo systemctl enable gpsd.service`  
`sudo systemctl start gpsd.service`  
On reboot ...

Si tout c'est bien passer INDI devrai pouvoi communiquer avec votre GPS via le driver Auxiliaire GPSD.
