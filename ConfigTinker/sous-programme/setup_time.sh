################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#!/bin/bash
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$(find ~ -name ConfigTinker)
######
# Fonction pour l'installation
######
source $dirinstall/sous-programme/detect_language.sh
if $french
then
	sethour[0]="Mise à l'heure du système"
	sethour[1]="Réglage date et heure"
	compute[2]="Entrez les paramètres dans l'ordre demandé"
	compute[3]="Jour"
	compute[4]="Mois"
	compute[5]="Année"
	compute[6]="Heure" 
	compute[7]="Minutes"
	compute[8]="Secondes"
else
	compute[0]="System time setup"
	compute[1]="Set date and time"
	compute[2]="Input the parameters in required order"
	compute[3]="Day"
	compute[4]="Month"
	compute[5]="year"
	compute[6]="Hour" 
	compute[7]="Minutes"
	compute[8]="Seconds"
fi


DIALOG=${DIALOG=dialog}
fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
trap "rm -f $fichtemp" 0 1 2 5 15

$DIALOG  --backtitle "${compute[0]}" --title "${compute[1]}" \
--form "${compute[2]}" 20 30 25 \
"${compute[3]}" 1 1 "01" 1 15 8 25 \
"${compute[4]}" 2 1 "06" 2 15 8 25 \
"${compute[5]}" 3 1 "2017" 3 15 8 25 \
"${compute[6]}" 4 1 "16" 4 15 8 25 \
"${compute[7]}" 5 1 "30" 5 15 8 25 \
"${compute[8]}" 6 1 "00" 6 15 8 25 \
2>$fichtemp
exitstatus=$?
if [ $exitstatus = 0 ]; then
	readarray values < $fichtemp
	DD=$(echo ${values[0]} | xargs)
	MM=$(echo ${values[1]} | xargs)
	YY=$(echo ${values[2]} | xargs)
	HH=$(echo ${values[3]} | xargs)
	MN=$(echo ${values[4]} | xargs)
	SS=$(echo ${values[5]} | xargs)
	sudo date +%Y%m%d -s "$YY$MM$DD"
	sudo date +%T -s "$HH:$MN:$SS"
fi



