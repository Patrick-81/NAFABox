################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#!/bin/bash
#dialog --checklist "Choisissez le soft à l'installation:" 11 40 4 1 lin_guider on 2 phd2 off 3 "Carte du ciel" off 4 Siril off



DIALOG=${DIALOG=dialog}
fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
trap "rm -f $fichtemp" 0 1 2 5 15

$DIALOG --backtitle "Installation/Mise à jour des logiciels" \
	--title "Installation complémentaire" --clear \
    --checklist "Choisir le(s) logiciel(s) à installer" 20 61 6 \
        0 "Installation de base" ON\
		1 "Lin_guider" off\
		2 "build INDI" off\
		3 "build Kstars" off\
		4 "Carte du ciel" off\
		5 "Ccdciel" off\
		6 "Planetary Imager" off\
		7 "Siril" off 2> $fichtemp
valret=$?
for n in $(cat $fichtemp)
do
	case $n in
	0)
		echo "Installation de base"
		$(pwd)/install_base.sh;;
	1) 
		echo "Installation de Lin_guider"
		$(pwd)/install_linguider.sh;;
	2)
		echo "Installation de INDI";;
	3)
		echo "Installation de Carte du ciel";;
	4)
		echo "Installation de Carte du ciel"
		$(pwd)/install_libpasastro.sh
		$(pwd)/install_skychart.sh;;
	5)
		echo "Installation de ccdciel"
		$(pwd)/install_libpasastro.sh
		$(pwd)/install_ccdciel.sh;;
	255)
		echo "escape";;
	esac
done

