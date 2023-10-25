################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# On June 10 2017
# V0.1
# v0.2  ajout de browsepy (Patrick Dutoit)
################################################
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
server_choice=$1

figlet -k Install Hostname
echo "================================================="
echo "================================================="

if [[ ${server_choice} == "server" ]] || [[ ${server_choice} == "default" ]]
then
    touch /tmp/dialogtmp && FICHTMP=/tmp/dialogtmp
    trap "rm -f ${FICHTMP}" 0 1 2 3 5 15
    dialog --backtitle "HostName changer" \
           --title "Choose your HostName :" \
           --inputbox "Chose your HostName (no special character):" 8 47 NAFABox 2> ${FICHTMP}
    # retour d'information (boîte d'info)
    # 0 est le code retour du bouton Accepter
    # ici seul celui-ci attribue un nom de login.
    if [[ $? == 0 ]]
    then 
        new_host="`cat $FICHTMP`"
        def_host=`cat /etc/hostname`
	sudo echo ${new_host} > /tmp/hostname
	sudo mv /tmp/hostname /etc/hostname

	if grep -q $def_host /etc/hosts
	then 
	    echo "hosts trouvé"
	else 
	    echo "hosts pas trouvé, creation"
	    sudo sed -i "1i127.0.0.1	"$def_host /etc/hosts
	fi
	    
	cat  /etc/hosts | sed -e "s=$def_host=$new_host=g" > /tmp/hosts
	sudo mv /tmp/hosts /etc/hosts
	echo "hostname change for $new_host"
	    
    else 
        echo "hostname not change"
    fi
else
    if name=`yad --width=300 \
			    --center \
			    --form \
			    --title="Choose your HostName :" \
			    --text="Chose your HostName (no special character):" \
			    --field="HostName:" "NAFABox"`
    then
        new_host=$(echo "$name" | cut -d "|" -f1)
        def_host=`cat /etc/hostname`
        sudo echo ${new_host} > /tmp/hostname
        sudo mv /tmp/hostname /etc/hostname
	    
        if grep -q $def_host /etc/hosts
        then 
            echo "hosts trouvé"
        else 
            echo "hosts pas trouvé, creation"
            sudo sed -i "1i127.0.0.1	"$def_host /etc/hosts
        fi
	    
        cat  /etc/hosts | sed -e "s=$def_host=$new_host=g" > /tmp/hosts
        sudo mv /tmp/hosts /etc/hosts
        echo "hostname change for $new_host"
    else
        echo "hostname not change"
    fi
fi
