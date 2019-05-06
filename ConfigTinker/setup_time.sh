################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
#				Sébastien Durand
# On June 10 2017
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
# Fonction pour l'installation
######
source ${dirinstall}/detect_language.sh
if ${french}
then
	compute[0]="Mise à l'heure du système"
	compute[1]="Réglage date et heure"
	compute[2]="Heure" 
	compute[3]="Minutes"
	compute[4]="Secondes"
	compute[5]="Date"
else
	compute[0]="System time setup"
	compute[1]="Set date and time"
	compute[2]="Hour" 
	compute[3]="Minutes"
	compute[4]="Seconds"
	compute[5]="Date"
fi

LC_ALL="en_US.UTF-8"
default_h=`date +%k`
default_m=`date +%M`
default_s=`date +%S`
default_date=`date +%B/%d/%Y`


if temps=`yad --width=300 \
	--center \
	--form \
    --date-format="%B/%d/%Y" \
	--title="${compute[0]}" \
	--image=${dirinstall}/setup_time.png \
	--text="${compute[1]}" \
	--field="${compute[2]}" \
	--field="${compute[3]}" \
	--field="${compute[4]}" \
	--field="${compute[5]}":DT \
	"$default_h" "$default_m" "$default_s" "$default_date"`
then

	# recuperation des valeurs
	HH=$(echo "$temps" | cut -d "|" -f1) #heures
	MM=$(echo "$temps" | cut -d "|" -f2) #minutes
	SS=$(echo "$temps" | cut -d "|" -f3) #secondes
	date_t=$(echo "$temps" | cut -d "|" -f4) #date
	mon=$(echo "$date_t" | cut -d "/" -f1) #jour
	day=$(echo "$date_t" | cut -d "/" -f2) #mois
	years=$(echo "$date_t" | cut -d "/" -f3) #annee

    mon=`echo ${mon} | sed -e 's/\(.\{1\}\)/\U\1/'`
    mon=${mon:0:3}
	sudo date -s "$mon $day $years $HH:$MM:$SS"
else
	echo "cancel"
fi
