################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On Sept 02 2018
# V0.1
################################################
#!/bin/bash -i

server_choice=$1

if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
else
    ######
    # detect language
    ######
    source $dirinstall/detect_language.sh

    if $french
    then
        title[0]="Choix du type d'installation :"
        title[1]="Menu"
        menu_text="Choisisez le type d'installation NAFABox désiré.

Installation par defaut: sans interface graphique, 
                         fonctions réseaux, phd2 
                         et kstars/ekos/indi
Installation server: sans interface graphique, 
                     fonction necessitant pas 
                     d'intreface graphique 
                     pour le pilotage a distance
Installation custom: avec interface graphique, 
                     choisir ce que vous voulez 
                     installer"
        choice[0]="Installation par defaut"
        choice[1]="Installation mode server"
        choice[2]="Installation custom"
    else
        title[0]="Choice installation type :"
        title[1]="Menu"
        menu_text="Choose the desired NAFABox installation type.

Default installation: without graphical interface,
                      network functions, phd2 and 
                      kstars / ekos / indi
Installation server: without graphical interface, 
                     functions that do not require 
                     a graphical interface for 
                     remote control
Custom installation: with graphical interface, 
                     choose what you want to install"
        choice[0]="Default installation"
        choice[1]="Installation server"
        choice[2]="Custom installation"
    fi     

    if [[ $server_choice == "" ]]
    then
        trap sert à être propre.
        touch /tmp/dialogtmp && FICHTMP=/tmp/dialogtmp
        trap "rm -f $FICHTMP" 0 1 2 3 5 15 
        # dialog for inital choice
        dialog --backtitle "${title[0]}" --title "${title[1]}" \
        --menu "$menu_text" 22 60 6 \
        "default" "${choice[0]}" \
        "server" "${choice[1]}" \
        "custom" "${choice[2]}" 2> $FICHTMP
        # traitement de la réponse
        if [ $? = 0 ]
        then
            for i in `cat $FICHTMP`
            do
                case $i in
                default)
                    server_choice="default" ;;
                server) 
                    server_choice="server" ;;
                custom) 
                    server_choice="custom" ;;
                esac
            done
        else
            exit
        fi
    fi

    sudo apt-get update
    figlet -k NAFABox
    echo "================================================="
    echo "================================================="
    if [[ $server_choice == "server" ]]
    then
        echo "############################"
        echo "## install in server mode ##"
        echo "############################"
	    $nafabox_path/install_conf.sh initial $server_choice | tee -a "$nafabox_path/nafabox.log"

    elif [[ $server_choice == "default" ]]
    then
        echo "############################"
        echo "## install in default mode ##"
        echo "############################"
	    $nafabox_path/install_conf.sh initial $server_choice | tee -a "$nafabox_path/nafabox.log"
    elif [[ $server_choice == "custom" ]]
    then
	    echo "############################"
        echo "## install in custom mode ##"
        echo "############################"        

	    $nafabox_path/install_conf.sh initial | tee -a "$nafabox_path/nafabox.log"
    else
        echo "wrong install mode"
        exit
    fi
fi
