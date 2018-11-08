#!/bin/bash -i
options="-y"
######
# Recherche du répertoire ConfigTinker
######
if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=$nafabox_path

figlet -k Install Switch_Language
echo "================================================="
echo "================================================="

######
# detect current language
######
source $dirinstall/detect_language.sh
# open fd
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
if $french
then
	lbl[0]="Language for all system "
	lbl[1]="Choose your language. Reboot after install"
	lbl[2]="French"
	lbl[3]="English"
else
	lbl[0]="Langue pour l'ensemble du systeme"
	lbl[1]="Choisissez votre langue. Reboot après install"
	lbl[2]="Français"
	lbl[3]="Anglais"
fi

if ret=`yad --width 400 \
			--center \
			--entry \
			--title "${lbl[0]}" \
			--image=switch_language \
			--text "${lbl[1]}" \
			--entry-text "${lbl[2]}" "${lbl[3]}"`
then
	reponse=$ret
	if [[ $reponse == ${lbl[3]} ]]
	then
		# passer le systeme en français
		# ajout des packs langage
		sudo apt-get $options install language-pack-kde-en
		sudo apt-get $options install language-pack-en language-pack-gnome-en
		sudo apt-get $options install firefox-locale.en
		sudo locale-gen en_US en_US.UTF-8
		sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
		sudo dpkg-reconfigure keyboard-configuration
		exit
	elif [[ $reponse == ${lbl[2]} ]]
	then
		# passer le systeme en français
		# ajout des packs langage
		sudo apt-get $options install language-pack-kde-fr
		sudo apt-get $options install language-pack-fr language-pack-gnome-fr
		sudo apt-get $options install firefox-locale.fr
		sudo locale-gen fr_FR fr_FR.UTF-8
		sudo update-locale LC_ALL=fr_FR.UTF-8 LANG=fr_FR.UTF-8
		sudo dpkg-reconfigure keyboard-configuration
		exit

	fi
else
	echo "cancel"
	exit
fi

