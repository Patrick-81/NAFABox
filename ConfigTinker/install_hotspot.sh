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

figlet -k Install HotSpot
echo "================================================="
echo "================================================="

######
# pre-requis
######
installed=$(apt -qq list uuid)
testinstall=$([[ $(grep "install" <<< $installed) ]] && echo true || echo false)

if ${testinstall}
#if test -z "$installed"
then
	echo "installé"
else
	echo "installation uuid"
	sudo apt-get -y install uuid
fi
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

    default_hostname="$moi"

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
		    name_w=$(echo "$option" | cut -d "|" -f2)
		    mdp=$(echo "$option" | cut -d "|" -f3)

            # add "_box" for hotspot name
		    hotspot_name=${name_w}"_box"

		    mac_address=$(sudo cat /sys/class/net/${de_wifi}/address)
		    security="[wifi-security]\ngroup=\nkey-mgmt=wpa-psk\npairwise=\nproto=\npsk=MDP"

		    fic0=$(tempfile)
		    cat ${dirinstall}/nafabox.template | sed -e "s/WLAN/${de_wifi}/g" > ${fic0}
		    fic1=$(tempfile)
		    cat ${fic0} | sed -e "s/HOTSPOTNAME/${hotspot_name}/g" > ${fic1}
		    fic2=$(tempfile)
		    cat ${fic1} | sed -e "s/UUID/${hsuuid}/g" > ${fic2}
		    fic3=$(tempfile)
		    cat ${fic2} | sed -e "s/MAC_ADDRESS/${mac_address}/g" > ${fic3}
	    

		    if [[ -z "$mdp" ]]
		    then
			    fic5=$(tempfile)
			    cat ${fic3} | sed -e "s/SECURITY//g" > ${fic5}
		    else
			    fic4=$(tempfile)
			    cat ${fic3} | sed -e "s/SECURITY/${security}/g" > ${fic4}
			    fic5=$(tempfile)
			    cat ${fic4} | sed -e "s/MDP/${mdp}/g" > ${fic5}
		    fi
		    ######
		    # Find active access point
		    ######
		    activeap=$(iw ${de_wifi} info | grep ssid | cut -f 2 -d" ")
            sudo systemctl stop NetworkManager
		    if test ! -z ${activeap}
		    then
			    sudo rm -f /etc/NetworkManager/system-connections/${activeap}
		    fi
		    ######
		    # Create new one
		    ######
		    sudo cp ${fic5} /etc/NetworkManager/system-connections/${hotspot_name}
		    
		    sleep 5
		    sudo systemctl start NetworkManager


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


