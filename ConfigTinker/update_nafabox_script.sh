################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# On June 10 2017
# V0.1
################################################
#!/bin/bash -i
######
# Recherche du répertoire ConfigTinker
######
if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=$nafabox_path
######
# Fonction pour l'installation
######
source $dirinstall/detect_language.sh
if $french
then
	title="Mise à jour des script NAFABox"
	text="Voulez vous mettere à jour les script NAFABox ?"
	message="suppression de l'ancien dossier NAFABOX"
else
	title="Update NAFABox Script"
	text="Do you want to update the NAFABox scripts?"
	message="delete outdate NAFABox Folder"
fi


if choix=`yad --width 350 --height 100 \
				--center \
				--title="$title" \
				--text="$text" \
				--button="gtk-yes:0" \
				--button="gtk-no:1" \
				--button="gtk-cancel:1"`
then

	cd $dirinstall/../
	nafa_path=`pwd`
	cd $dirinstall/../../
	back_path=`pwd`
	if [[ "${dirinstall: -20}" == "NAFABox/ConfigTinker" ]] 
	then
		echo "suppression de l'ancien dossier NAFABox"
		rm -Rf $nafa_path
		cd $back_path
		git clone https://github.com/Patrick-81/NAFABox.git
		cd NAFABox
		git checkout beta
		$dirinstall/install_conf.sh
		echo "script update"
	else
		echo "error wrong path for nafabox script, need run Pre_install.sh"
	fi
else
	echo "exit"
fi
