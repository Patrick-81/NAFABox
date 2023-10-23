#!/bin/bash -i
######
# Recherche du répertoire ConfigTinker
######
if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi

dirinstall=${nafabox_path}
echo $dirinstall

figlet -k Install HotSpot
echo "================================================="
echo "================================================="
######
# detect language
######
source ${dirinstall}/detect_language.sh
######
# recupere le user
######
moi=$(whoami)
######
# Get mac_address
######
# get wifi device
device=($(basename -a $(find /sys/class/net -name wl*)))
if test ! -z ${device}
then
	if ${french}
	then
    pop="Voulez vous créer un point d'accés ?"
  else
    pop="Do you want to create an hotspot ?"
  fi
  # list all wifi device :
  echo ${device[@]} | tr " " ! > /tmp/device
  liste_device=`cat /tmp/device`



	if option=`yad --center \
                 --image dialog-question \
                 --title Alert \
                 --button=gtk-yes:0 \
                 --button=gtk-no:1 \
                 --text "$pop"`
  then
    ######
    # Créer l'uuid
    ######
	  hsuuid=$(uuid)


    ######
    # Création du hotspot
    ######
	  if ${french}
	  then
		  dial[0]="Fixer un nom discriminant pour votre hotspot"
		  dial[1]="Soyez créatif d'autres personnes peuvent aussi utiliser une NAFABox"
		  dial[2]="Nom original pour votre hotspot ou défaut"
		  dial[3]="Nom du HotSpot :"
	  else
		  dial[0]="Give a discriminant name for your hotspot"
		  dial[1]="Be creative other people close to you may also use a NAFABox"
		  dial[2]="Original name for your hotspot or default"
		  dial[3]="HotSpot Name :"
	  fi

	  # Demande du nom de hotspot
	  if option=`yad --width 450 \
				    --center \
				    --form \
				    --title "${dial[2]}" \
				    --image=${dirinstall}/install_hotspot.png \
				    --text "${dial[0]}, \n${dial[1]}" \
				    --field="WIFI Board :":CB "$liste_device" \
				    --field="${dial[2]}" "$default_hostname" \
				    --field="Password (8 characters min):":H`

	  then
		  de_wifi=$(echo "$option" | cut -d "|" -f1)
		  hotspot_name=$(echo "$option" | cut -d "|" -f2)
		  mdp=$(echo "$option" | cut -d "|" -f3)

		  mac_address=$(sudo cat /sys/class/net/${de_wifi}/address)

		  if [[ -z "$mdp" ]]
		  then
        mdp="nafa1234"
		  fi
		  ######
		  # Find active access point
		  ######
		  activeap=$(iw ${de_wifi} info | grep id | cut -f 2 -d" ")
      sudo systemctl stop NetworkManager

		  if test ! -z ${activeap}
		  then
			  nmcli connection down hotspot ifname ${de_wifi}
        nmcli connection delete hotspot
		  fi
		  ######
		  # Create new one
		  ######
		  nmcli connection down hotspot ifname ${de_wifi}
      nmcli connection delete hotspot

      nmcli connection add type wifi ifname ${de_wifi} con-name hotspot autoconnect yes ssid ${hotspot_name}
      nmcli connection modify hotspot 802-11-wireless.mode ap 802-11-wireless.band bg 802-11-wireless.channel 1 # bande a utilisé (a = 5GHz, bg = 2.4GHz)

      nmcli connection modify hotspot 802-11-wireless-security.key-mgmt wpa-psk # type de sécurité
      # nmcli connection modify hotspot 802-11-wireless-security.proto rsn # type de wpa ( wpa ou rsn)
      # nmcli connection modify hotspot 802-11-wireless-security.group ccmp # type of group encryption algo (tkip, ccmp)
      # nmcli connection modify hotspot 802-11-wireless-security.pairwise ccmp # list of pairwise encryption algo (tkip, ccmp)
      nmcli connection modify hotspot 802-11-wireless-security.psk ${mdp} # mot de passe
      nmcli connection modify hotspot ipv4.method shared

      nmcli connection up hotspot ifname ${de_wifi}
      # nmcli connection up uuid ${hsuuid}

      # commande alternatif
      # nmcli dev wifi hotspot ifname ${de_wifi} con-name hotspot ssid ${hotspot_name} band bg channel 1 password ${mdp}
      # nmcli dev wifi show-password #--> see wifi name, password and QRcode


	  else
      echo "[ESC] key pressed."
		  exit
	  fi
  else
	  if ${french}
	  then
      pop="supprimer un point d'acces ?"
      dial[0]="Supprimer le point d'acces :"

    else
      pop="Remove Hotspot ?"
		  dial[0]="Remove Hotspot :"
    fi

	  if option=`yad --width 450 \
				    --center \
				    --form \
				    --title "$pop" \
				    --image=${dirinstall}/install_hotspot.png \
				    --text "${dial[0]}" \
				    --field="WIFI Board :":CB "$liste_device"`

	  then
		  de_wifi=$(echo "$option" | cut -d "|" -f1)
      activeap=$(iw ${de_wifi} info | grep ssid | cut -f 2 -d" ")

      sudo systemctl stop NetworkManager

      if test ! -z ${activeap}
		  then
        sudo rm -f /etc/NetworkManager/system-connections/${activeap}
      fi

      sleep 5
		  sudo systemctl start NetworkManager

    fi
	fi
else
	echo "No wifi decice found"
fi

