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
# Calcul de champ
######
# test locale
######
source detect_language.sh
if $french
then
	compute[0]="Chargement des fichiers index"
	compute[1]="Caractéristiques du setup"
	compute[2]="\nEntrez les grandeurs caractéristiques"
	compute[3]="Focale (mm)"
	compute[4]="Réducteur/Barlow (x)"
	compute[5]="Résolution horizontale capteur(pix)"
	compute[6]="Résolution verticale capteur(pix)" 
	compute[7]="Taille horizontale pixel(µm)"
	compute[8]="Taille verticale pixel (µm)"
else
	compute[0]="Index file load"
	compute[1]="Your setup characteristics"
	compute[2]="\nInput characteristic sizes"
	compute[3]="Focal (mm)"
	compute[4]="Reducer/Barlow (x)"
	compute[5]="Horizontal sensor resolution (pix)"
	compute[6]="Vertical sensor resolution(pix)" 
	compute[7]="Horizontal pixel size(µm)"
	compute[8]="Vertical pixel size (µm)"
fi
echo ${compute["baktitle"]}

DIALOG=${DIALOG=dialog}
fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
trap "rm -f $fichtemp" 0 1 2 5 15

$DIALOG  --backtitle "${compute[0]}" --title "${compute[1]}" \
--form "${compute[2]}" 20 60 30 \
"${compute[3]}" 1 1 "1200" 1 38 15 30 \
"${compute[4]}" 2 1 "1" 2 38 15 30 \
"${compute[5]}" 3 1 "3096" 3 38 15 30 \
"${compute[6]}" 4 1 "2080" 4 38 15 30 \
"${compute[7]}" 5 1 "2.4" 5 38 15 30 \
"${compute[8]}" 6 1 "2.4" 6 38 15 30 \
2>$fichtemp

readarray values < $fichtemp
F=$(echo ${values[0]} | xargs)
R=$(echo ${values[1]} | xargs)
F=$(echo "scale=2;$F*$R" | bc)
RH=$(echo ${values[2]} | xargs)
RV=$(echo ${values[3]} | xargs)
PH=$(echo ${values[4]} | xargs)
PV=$(echo ${values[5]} | xargs)

LC=$(echo "scale=2;($PH*$RH/1000.0)" | bc)
HC=$(echo "scale=2;($PV*$RV/1000.0)" | bc)
ChampX=$(echo "scale=2;(60*57.3*$LC/$F)" | bc)
ChampY=$(echo "scale=2;(60*57.3*$HC/$F)" | bc)
Diag=$(echo "scale=2;sqrt($ChampX*$ChampX+$ChampY*$ChampY)" | bc)
v=$(echo "$ChampX<$ChampY" | bc)
if [[ $v -eq 1 ]]
then
	vmin=$ChampX
else
	vmin=$ChampY
fi
#echo "Largeur capteur (mm) "$LC" Hauteur capteur(mm)"$HC\
#	" Champ X(') "$ChampX" Champ Y(') "$ChampY" Diag (') "$Diag
######
# Charger le fichier des références d'index
######
file2read=$(pwd)/index.txt
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
	a=$(echo "$Diag <= ${tabvmax[$index]}" | bc)
	if [[ $a -eq 1 ]]
	then
		a=$(expr "$Diag >= ${tabvmin[$index]}" | bc)
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

