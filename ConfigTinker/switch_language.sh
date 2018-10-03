#!/bin/bash
options="-y"
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$(head -n 1 temp_directory.tmp)
######
# detect current language
######
source $dirinstall/detect_language.sh | tee -a "$dirinstall/nafabox.log"
# open fd
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
if $french
then
	lbl[0]="Language for all system "
	lbl[1]="Language"
	lbl[2]="Choose your language. Reboot after install"
	lbl[3]="French"
	lbl[4]="English"
else
	lbl[0]="Langue pour l'ensemble du systeme"
	lbl[1]="Langue"
	lbl[2]="Choisissez votre langue. Reboot après install"
	lbl[3]="Français"
	lbl[4]="Anglais"
fi

dialog\
 --backtitle "${lbl[0]}"\
 --title "${lbl[1]}" --clear\
 --radiolist "${lbl[2]}" 20 61 5\
 "1" "${lbl[3]}" ON\
 "2" "${lbl[4]}" off 2> $tempfile
retval=$?
choice=$(cat $tempfile)
#echo "$choice"
case $retval in
  0)
    echo "'$choice' is choice";;
  1)
    echo "Cancel pressed.";;
  255)
    echo "ESC pressed.";;
esac
case $choice in
	2)
	# passer le systeme en français
	# ajout des packs langage
	sudo apt-get $options install language-pack-kde-en
	sudo apt-get $options install language-pack-en language-pack-gnome-en
	sudo apt-get $options install firefox-locale.en
	sudo locale-gen en_US en_US.UTF-8
	sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
	sudo dpkg-reconfigure keyboard-configuration
	;;
	1)
	# passer le systeme en français
	# ajout des packs langage
	sudo apt-get $options install language-pack-kde-fr
	sudo apt-get $options install language-pack-fr language-pack-gnome-fr
	sudo apt-get $options install firefox-locale.fr
	sudo locale-gen fr_FR fr_FR.UTF-8
	sudo update-locale LC_ALL=fr_FR.UTF-8 LANG=fr_FR.UTF-8
	sudo dpkg-reconfigure keyboard-configuration
	;;
	255)
    echo "ESC pressed.";;
esac

