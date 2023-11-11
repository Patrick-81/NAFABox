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

# demande de creation hotspot y/n
if test ! -z ${device}
then
	if ${french}
	then
    pop="Voulez vous créer un point d'accés ?"
  else
    pop="Do you want to create an hotspot ?"
  fi

  #create list all wifi device :
  basename -a $(find /sys/class/net -name wl*) | tr "\n" ! > /tmp/device
  sed -i 's/!$//' /tmp/device
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

		  # mac_address=$(sudo cat /sys/class/net/${de_wifi}/address)

		  if [[ -z "$mdp" ]]
		  then
        mdp="nafa12345678"
		  fi
		  #create list all wifi canal :
		  echo $(iwlist ${de_wifi} channel | tail -n+2) > /tmp/canal
		  sed -i -e "s/z /z\!/g" /tmp/canal
		  liste_canal=`cat /tmp/canal`
      if option=`yad --width 450 \
                     --center \
                     --form \
                     --title "Choose Canal" \
                     --image=${dirinstall}/install_hotspot.png \
                     --text "Choose Canal" \
                     --field="Canal Support :":CB "$liste_canal"`

      then
        de_canal=$(echo "$option" | cut -d "|" -f1)
        echo $de_canal
        channel_select="1" #$(echo $de_canal | awk '{print $2}')
        canal_select="bg" #$(echo $test | awk '{print $4}') if <3 alors =bg sinon =a

        ######
        # delete Hotspot
        ######
        # nmcli connection down Hotspot ifname ${de_wifi}
        nmcli connection delete Hotspot

        ######
        # Create HotSpot
        ######
        nmcli dev wifi hotspot ifname ${de_wifi} ssid ${hotspot_name} band ${canal_select} channel ${channel_select} password ${mdp}
        nmcli connection modify Hotspot connection.autoconnect yes
		nmcli connection modify Hotspot 802-11-wireless-security.proto rsn
    fi
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

		  # remove hotspot
			# nmcli connection down Hotspot ifname ${de_wifi}
      nmcli connection delete Hotspot

    fi
	fi
else
	echo "No wifi decice found"
fi

