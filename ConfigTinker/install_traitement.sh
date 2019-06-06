################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors: Sébastien Durand
# On April 21 2019
# V0.1
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


######
# detect processeur
######
source ${dirinstall}/proctype.sh

figlet -k Install processing software
echo "================================================="
echo "================================================="
######
# detect language
######
source ${dirinstall}/detect_language.sh

if [[ -d ~/Desktop ]]
then
	desktop="Desktop"
else
	desktop="Bureau"
fi

if ${french}
then
	dial[0]="Installation/Mise à jour des logiciels"
	dial[1]="Choisir le(s) logiciel(s) à installer"
	choice[0]="Siril"
    choice[1]="Darktable"
    choice[2]="GIMP"
    choice[3]="Ser Player"
    choice[4]="Stackistry"
    choice[5]="ImPPG"
    
else
	dial[0]="Install/Update of software"
	dial[1]="Choose software(s) to install"
	choice[0]="Siril"
    choice[1]="Darktable"
    choice[2]="GIMP"
    choice[3]="Ser Player"
    choice[4]="Stackistry"
    choice[5]="ImPPG"
fi

st=(false)

if chose=`yad --width=400 \
	--center \
	--form \
	--title="${dial[0]}" \
	--text="${dial[1]}" \
	--field=":LBL" \
	--field="${choice[0]}:CHK" \
    --field="${choice[1]}:CHK" \
    --field="${choice[2]}:CHK" \
    --field="${choice[3]}:CHK" \
    --field="${choice[4]}:CHK" \
    --field="${choice[5]}:CHK" \
	"" "${st[0]}" "${st[1]}" "${st[2]}" \
    "${st[3]}" "${st[4]}" "${st[5]}"`
then
	s_siril=$(echo "$chose" | cut -d "|" -f2)
    s_dark=$(echo "$chose" | cut -d "|" -f3)
    s_gimp=$(echo "$chose" | cut -d "|" -f4)
    ser_p=$(echo "$chose" | cut -d "|" -f5)
    stack=$(echo "$chose" | cut -d "|" -f6)
    impg=$(echo "$chose" | cut -d "|" -f7)
else
	echo "cancel"
fi

if [[ ${s_siril} == "TRUE" ]]
then
    ${dirinstall}/install_siril.sh
    ${dirinstall}/install_sirilic.sh
fi

if [[ ${s_dark} == "TRUE" ]]
then

    if [[ ${proc} == "_armhf" ]]
    then
        echo "darktable is not compatible with this platform"
    else
        sudo add-apt-repository -y ppa:pmjdebruijn/darktable-release
        sudo apt-get update
        sudo apt-get -y install darktable
    fi
    
fi

if [[ ${s_gimp} == "TRUE" ]]
then
	if ${french}
	then
        sudo apt-get install -y gimp-help-fr
    else
        sudo apt-get install -y gimp-help-en
    fi

    sudo apt-add-repository -y ppa:otto-kesselgulasch/gimp
    sudo apt-get update
    sudo apt-get install -y gimp

fi

if [[ ${ser_p} == "TRUE" ]]
then
    sudo apt-get install -y ser-player
fi

if [[ ${stack} == "TRUE" ]]
then

	#test si les dossiers existes, si oui suppression
	if [[ -d "/home/${USER}/bin/libskry" ]]
	then
	  echo "suppression de l'ancien dossier libskry"
	  rm -Rf /home/${USER}/bin/libskry
	fi
	if [[ -d "/home/${USER}/bin/stackistry" ]]
	then
	  echo "suppression de l'ancien dossier stackistry"
	  rm -Rf /home/${USER}/bin/stackistry
	fi
    version="0.3.0"
    sudo apt-get install -y libgtkmm-3.0-dev ffmpeg libavcodec-dev libavformat-dev libavutil-dev gcc g++
    cd ~/bin
    wget https://github.com/GreatAttractor/libskry/archive/v${version}.tar.gz
    tar zxvf v${version}.tar.gz
    rm ./v${version}.tar.gz
    mv ./libskry-${version} ./libskry
    cd ./libskry
    make

    cd ~/bin
    wget https://github.com/GreatAttractor/stackistry/archive/v${version}.tar.gz
    tar zxvf v${version}.tar.gz
    rm ./v${version}.tar.gz
    mv ./stackistry-${version} ./stackistry
    cd ./stackistry
    make
    cp ${dirinstall}/Stackistry.desktop ~/${desktop}/Stackistry.desktop
    sudo cp ~/${desktop}/Stackistry.desktop /usr/share/applications
fi

if [[ ${impg} == "TRUE" ]]
then
    sudo apt-get install -y libgtkmm-3.0-dev ffmpeg libavcodec-dev libavformat-dev libavutil-dev gcc g++ cmake libwxgtk3.0-dev libwxgtk-media3.0-dev libwxgtk-media3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libwxgtk3.0-gtk3-dev libfreeimage-dev

	#test si le dossiers existe, si oui suppression
	if [[ -d "/home/${USER}/bin/imppg" ]]
	then
	  echo "suppression de l'ancien dossier imppg"
	  rm -Rf /home/${USER}/bin/imppg
	fi
    #sudo ln -s /usr/bin/wx-config-3.0 /usr/bin/wx-config
    cd ~/bin
    git clone https://github.com/GreatAttractor/imppg.git
    cd ./imppg
    cmake -G "Unix Makefiles"
    make
    cp ${dirinstall}/Imppg.desktop ~/${desktop}/Imppg.desktop
    sudo cp ~/${desktop}/Imppg.desktop /usr/share/applications
fi

