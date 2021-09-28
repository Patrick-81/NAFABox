# Tuto pour forcer une resolution sur un raspberry pi :

Les Raspberry PI ne réagisse pas comme un ordinateur standard pour la resolution 
d'affichage.

Vous ne pouvez donc pas utiliser l'application **SetRes**

Pour une utilisation nomade (sans écran), il est necessaire de forcer 
une resolution d'affichage afin de ne pas se retrouver avec une resolution trop 
faible sur **VNC/NoMachine**.  

Pour **Kstars**, afin d'afficher correctement toute les options, il est necessaire 
d'avoir plus qu'un carré de 800x800 pixel.  
On peut donc voir que la resolution HD (720p ou 1280x720) n'est pas suffisante.

Sur les Raspberry Pi pour forcer une resolution même quand aucun écran est branché, 
il faut modifier le fichier de configuration.

## Modification du fichier config.txt :

Le fichier **config.txt** contient toutes les options de configuration du raspberry.
Pour trouver ce fichier rien ne plus simple, 2 choix s'offre a vous :

### Via le terminal sur le raspberry :

Vous pouvez taper (sur ubuntu mate): `pluma /boot/config.txt`

### Via un autre ordinateur :

Branchez la carte SD à l'ordinateur et acceder à la partition/disque **PI_BOOT**.
Il ne vous reste plus qu'à ouvrir le fichier **config.txt**.

-----------------------

Nous allons maintenant modifier le fichier **config.txt**. 
Pour cela il vas falloir déjà verifier que les lignes permetant de forcer 
la resolution ne sont pas déjà présentes dans le fichier.

Les lignes à repérer sont les suivantes ( avec **..** = une valeur quelconque):   
`hdmi_force_hotplug=..`    
`hdmi_ignore_hotplug=..`     
`disable_overscan=..`      
`hdmi_mode=..`   
`hdmi_group=..`   
   
Si vous trouvez ces lignes il faudra les supprimer ou les commenter pour plus de 
prudence ( rajouter seulement un `#` devant la ligne que vous shouaitez commenter).

Une fois fait il ne vous reste plus qu'à ajouter les lignes suivantes à la fin du fichier :     
`hdmi_force_hotplug=1`   
`disable_overscan=1`   

Ainsi que les ligne **hdmi_group=..** et **hdmi_mode=..** en fonction du choix de la resolution voulu : 

(les tableaux ne contienne que les resolutions compatibles avec **kstars** + HD 720p)   
**ATTENTION**: la resolution sera forcé, donc si vous réglez sur une resolution 
non supporté par l'écran sur lequel le raspberry sera branché alors vous aurez un écran noir. 

Pour :   
`hdmi_group=1`   
 
| hdmi_mode 	| resolution 	| frequence 	| notes              |   
|-----------|---------------|-----------|-------------------|    
|4      	|720p       	|60Hz 	    |                   |   
|16     	|1080p      	|60Hz    	|                   |   
|19     	|720p 	        |50Hz   	|                   |    
|20     	|1080i      	|50Hz   	|                   |   
|31     	|1080p      	|50Hz    	|                   |   
|32     	|1080p      	|24Hz   	|                   |   
|33     	|1080p      	|25Hz   	|                   |   
|34     	|1080p      	|30Hz   	|                   |   
|39     	|1080i      	|50Hz    	|reduced blanking   |   
|40     	|1080i      	|100Hz   	|                   |   
|41     	|720p       	|100Hz 	    |                   |   
|46     	|1080i      	|120Hz  	|                   |   
|47     	|720p       	|120Hz  	|                   |
   
Pour :   
`hdmi_group=2`   

|hdmi_mode 	|resolution 	|frequency 	|notes	            |   
|:-----------|:---------------|:-----------|:-------------------|    
|21 	    |1152x864 	    |75Hz 	    |                   |  
|32     	|1280x960    	|60Hz   	|                   |  
|33     	|1280x960   	|85Hz   	|                   |  
|34     	|1280x960   	|120Hz  	|reduced blanking   |  
|35     	|1280x1024   	|60Hz   	|                   |  
|36     	|1280x1024 	    |75Hz       |                   |  
|37     	|1280x1024  	|85Hz       |                   |  	
|38     	|1280x1024  	|120Hz  	|reduced blanking   |  
|41     	|1400x1050  	|	        |reduced blanking   |  
|42     	|1400x1050  	|60Hz       |                   |  	
|43     	|1400x1050  	|75Hz   	|                   |  
|44     	|1400x1050  	|85Hz   	|                   |  
|45     	|1400x1050  	|120Hz   	|reduced blanking   |  
|46     	|1440x900   	|       	|reduced blanking   |  
|47     	|1440x900   	|60Hz       |                   |  	
|48     	|1440x900   	|75Hz   	|                   |  
|49     	|1440x900   	|85Hz   	|                   |  
|50     	|1440x900   	|120Hz  	|reduced blanking   |  
|51     	|1600x1200   	|60Hz       |                   |	  
|52      	|1600x1200  	|65Hz   	|                   |  
|53     	|1600x1200  	|70Hz    	|                   |  
|54     	|1600x1200  	|75Hz   	|                   |   
|55     	|1600x1200  	|85Hz   	|                   |  
|56     	|1600x1200  	|120Hz   	|reduced blanking   |  
|57     	|1680x1050      |	    	|reduced blanking   |  
|58     	|1680x1050  	|60Hz   	|                   |  
|59     	|1680x1050  	|75Hz   	|                   |  
|60     	|1680x1050  	|85Hz    	|                   |  
|61     	|1680x1050  	|120Hz   	|reduced blanking   |  
|62     	|1792x1344  	|60Hz   	|                   |  
|63     	|1792x1344  	|75Hz   	|                   |  
|64     	|1792x1344  	|120Hz   	|reduced blanking   |  
|65     	|1856x1392  	|60Hz   	|                   |  
|66     	|1856x1392  	|75Hz   	|                   |  
|67     	|1856x1392  	|120Hz   	|reduced blanking   |  
|68      	|1920x1200      |	     	|reduced blanking   |  
|69     	|1920x1200  	|60Hz   	|                   |  
|70*     	|1920x1200  	|75Hz   	|                   |  
|71*    	|1920x1200  	|85Hz   	|                   |  
|72*    	|1920x1200  	|120Hz  	|reduced blanking   |  
|73*    	|1920x1440  	|60Hz   	|                   |  
|74*    	|1920x1440  	|75Hz   	|                   |  
|75*    	|1920x1440  	|120Hz   	|reduced blanking   |  
|76*    	|2560x1600      |	    	|reduced blanking   |  
|77*    	|2560x1600  	|60Hz   	|                   |  
|78*    	|2560x1600  	|75Hz    	|                   |  
|79*    	|2560x1600  	|85Hz   	|                   |  
|80*    	|2560x1600  	|120Hz   	|reduced blanking   |  
|82     	|1920x1080  	|60Hz   	|1080p              |  
|83     	|1600x900   	|       	|reduced blanking   |  
|84     	|2048x1152  	|	        |reduced blanking   |  
|85     	|1280x720   	|60Hz   	|720p               |  
    
*au dessus de la limite de resolution du raspberry

Une fois les lignes ajouté, n'oubliez pas de sauvegarder puis redémarer (ou remettre la carte SD).

**Pour aller plus loin (en anglais):** https://www.raspberrypi.org/documentation/configuration/config-txt/video.md
