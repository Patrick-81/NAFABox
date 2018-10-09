################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#!/bin/bash -i
######
# Calcul de champ
######
# Recherche du répertoire ConfigTinker
######
echo $1
if [ "$1" = "debug" ]
then
	dirinstall=$(pwd)
else
	dirinstall=$nafabox_path
fi

figlet -k Install Index
echo "================================================="
echo "================================================="

######
# Fonction min
######
valmin="define vmin(a, b) {
				if (a < b) {
					return (a);
				}
				return (b);
			}"
######
# test locale
######
source $dirinstall/detect_language.sh
if $french
then
	compute[0]="Chargement des fichiers index"
	compute[1]="Caractéristiques du setup"
	compute[2]="\nEntrez les grandeurs caractéristiques"
	compute[3]="Focale (mm)"
	compute[4]="Réducteur/Barlow (x)"
	compute[5]="Résolution horizontale capteur(pix)"
	compute[6]="Résolution verticale capteur(pix)" 
	compute[7]="Taille du pixel(µm)"
else
	compute[0]="Index file load"
	compute[1]="Your setup characteristics"
	compute[2]="\nInput characteristic sizes"
	compute[3]="Focal (mm)"
	compute[4]="Reducer/Barlow (x)"
	compute[5]="Horizontal sensor resolution (pix)"
	compute[6]="Vertical sensor resolution(pix)" 
	compute[7]="pixel size(µm)"
fi
echo ${compute["baktitle"]}

if tel=`yad --width=300 \
	--center \
	--form \
	--title="${compute[0]}" \
	--image=$dirinstall/install_index.png \
	--text="${compute[1]}\n${compute[2]} :" \
	--field=":LBL" \
	--field="${compute[3]}":NUM \
	--field="${compute[4]}":NUM \
	--field="${compute[5]}":NUM \
	--field="${compute[6]}":NUM \
	--field="${compute[7]}":NUM \
	"" \
	'2032!1..100000!1!2' \
	'1!0.1..10!0.1!1' \
	'3888!1..1000000!1!0' \
	'2592!1..1000000!1!0' \
	'5.7!0.1..100!0.1!2'`
then

	# recuperation des valeurs
	F=$(echo "$tel" | cut -d "|" -f2 | sed '/[0-9]\,/s/\,/./g') #focal
	R=$(echo "$tel" | cut -d "|" -f3 | sed '/[0-9]\,/s/\,/./g') #barlow ou reducteur
	RH=$(echo "$tel" | cut -d "|" -f4 | sed '/[0-9]\,/s/\,/./g') #nombre pixel horizontal
	RV=$(echo "$tel" | cut -d "|" -f5 | sed '/[0-9]\,/s/\,/./g') #nombre pixel vertical
	P=$(echo "$tel" | cut -d "|" -f6 | sed '/[0-9]\,/s/\,/./g') #taille pixel


	F=$(echo "scale=2;$F*$R" | bc)
	LC=$(echo "scale=2;($P*$RH/1000.0)" | bc)
	HC=$(echo "scale=2;($P*$RV/1000.0)" | bc)
	ChampX=$(echo "scale=2;(60*57.3*$LC/$F)" | bc)
	ChampY=$(echo "scale=2;(60*57.3*$HC/$F)" | bc)
	Diag=$(echo "scale=2;sqrt($ChampX*$ChampX+$ChampY*$ChampY)" | bc)
	vmax=$(echo "scale=2;0.5*$Diag" | bc)
	vmin=$(echo "$valmin;vmax($ChampX,$ChampY)" | bc) #--> bug

	#echo "Largeur capteur (mm) "$LC" Hauteur capteur(mm)"$HC\
	#	" Champ X(') "$ChampX" Champ Y(') "$ChampY" Diag (') "$Diag
	######
	# Charger le fichier des références d'index
	######
	file2read=$dirinstall/index.txt
	declare -a tabfile
	declare -a tabvmin
	declare -a tabvmax
	index=0
	while IFS='' read -r line || [[ -n "$line" ]]; do
		tabfile[$index]=$(echo $line | cut -f2 -d\;)
		intervalle=$(echo $line | cut -f1 -d\;)
		tabvmin[$index]=$(echo $intervalle | cut -f1 -d-)
		tabvmax[$index]=$(echo $intervalle | cut -f2 -d-)
		((index++))
	done < $file2read
	nval=$index

	######
	# Chercher les fichiers utiles
	######
	index=0
	while [ $index -lt $nval ]
	do
		a=$(echo "$vmin <= ${tabvmax[$index]}" | bc)
		if [[ $a -eq 1 ]]
		then
			a=$(expr "$vmin >= ${tabvmin[$index]}" | bc)
			if  [[ $a -eq 1 ]]
			then
				minfile=${tabfile[$index]}
				indmin=$index
			fi
		fi
		a=$(echo "$vmax <= ${tabvmax[$index]}" | bc)
		if [[ $a -eq 1 ]]
		then
			a=$(expr "$vmax >= ${tabvmin[$index]}" | bc)
			if  [[ $a -eq 1 ]]
			then
				maxfile=${tabfile[$index]}
				indmax=$index
			fi
		fi
		((index++))
	done

	######
	# what files to download ?
	######
	listfile=""
	for index in $(seq $indmax $indmin);
	do
		listfile=$listfile"\t"${tabfile[$index]}'\n'
	done
	#
	if $french
	then
		listfile=$(echo -e "Les fichiers a telecharger sont:\n"$listfile)
	else
		listefile=$(echo -e "Files to download:\n"$listfile)
	fi

	######
	# Select files to download
	######
	MENU_OPTIONS=
	allfiles=
	COUNT=0
	for index in $(seq $indmax $indmin);
	do
		IFS=':' read -r -a files <<< "${tabfile[$index]}"
		for f in ${files[@]}
		do
			ff="$f""_0.45_all.deb"
			response=$(curl --head "http://data.astrometry.net/debian/$ff" | grep Content-Length)
			length=$(echo $response | cut -f2 -d\:)
			length=$(echo $length | sed -e "s/\r//g")
			# Size MB
			length=$(expr "$length/1024/1024" | bc)
	   		COUNT=$[COUNT+1]
			allfiles[$COUNT]=$f
			label="$f""->$length(M)"
	   		MENU_OPTIONS="${MENU_OPTIONS} ${COUNT} $label off "
		done
	done

	if $french
	then
		select[0]="Sélectionnez les fichiers \
à installer:\nAttention à la taille des fichiers (jusqu'à plusieurs Go)\
\nVoir sur data.astrometry.net/debian"
		select[1]="installation du paquet "
		select[2]="installé"
		select[3]="est déjà installé"
		select[4]="problème d'installation pour "
	else
		select[0]="Select the files \
to install:\nBeware to the size of the files (some are many Go)\
\nTake a look on data.astrometry.net/debian"
		select[1]="install packet "
		select[2]="installed"
		select[3]="is yet installed"
		select[4]="Installation problems on "
	fi
# download files
	cmd=(dialog --separate-output --clear --checklist "${select[0]}" 22 76 16)
	options=(${MENU_OPTIONS})
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	for choice in $choices
	do
		f=${allfiles[$choice]}
		verifinstall=$(sudo apt list | grep $f)		
		if [[ -z "$verifinstall" ]]
		then
			echo "${select[1]} $f"
			wget http://data.astrometry.net/debian/$f\_0.45_all.deb -P /tmp
			sudo dpkg -i /tmp/$f\_0.45_all.deb
		else
			if [[ $verifinstall == *"${select[2]}"* ]]
			then
				echo "$f ${select[3]}"
			else
				echo "${select[4]} $f\n$verifinstall"
			fi
		fi
	done
else
	echo "cancel"
	exit
fi

