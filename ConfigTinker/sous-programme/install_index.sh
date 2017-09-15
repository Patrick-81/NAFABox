################################################
# Under GNU
#
# Authors:	Dugue Ludovic
# On Seept 15 2017
# V0.1
# 
################################################
#!/bin/bash
#set -xv
#
######################################
# récolter les information du setup: #
######################################
#
focale=$(whiptail --title "calcul des index necessaire" --inputbox "quelle est la focale de votre instrument en mm ?" 0 0 3>&1 1>&2 2>&3)

largeur=$(whiptail --title "calcul des index necessaire" --inputbox "quelle est la largeur de votre capteur en mm (coté le plus grand) ?" 0 0 3>&1 1>&2 2>&3)

hauteur=$(whiptail --title "calcul des index necessaire" --inputbox "quelle est la hauteur de votre capteur en mm (coté le plus petit) ?" 0 0 3>&1 1>&2 2>&3)
#echo $focale ";" $largeur ";" $hauteur
#
##############################
# calcul de champ min et max #
##############################
# 
# champ maxi
#
champmaxi=$(echo "scale=1;((3438*$largeur)/$focale)" | bc)
#
# champ mini
#
champmini=$(echo "scale=1;((3438*$hauteur)/$focale)" | bc)
#
################################################
# recherche des fichiers d'index à telecharger #
################################################
#
#création d'un dossier de travail
#
if (whiptail --title "Avertissement !!!" --yesno "Les fichiers d'index peuvent peser plusieurs Go de données, voulez-vous continuer ?" 0 0)
then
	#
	mkdir -p /tmp/index/
	#
	# test
	#
	if [[ $(echo "2<=$champmaxi&&$champmaxi<=2.8" | bc -l) == 1 ]] || [[ $(echo "2<=$champmini&&$champmini<=2.8" | bc -l) == 1 ]]
	then
		wget http://data.astrometry.net/debian/astrometry-data-4200-1_0.45_all.deb -P /tmp/index/
		wget http://data.astrometry.net/debian/astrometry-data-4200-2_0.45_all.deb -P /tmp/index/
		wget http://data.astrometry.net/debian/astrometry-data-4200-3_0.45_all.deb -P /tmp/index/
		wget http://data.astrometry.net/debian/astrometry-data-4200-4_0.45_all.deb -P /tmp/index/
	fi
	if [[ $(echo "2.8<=$champmaxi&&$champmaxi<=4" | bc -l) == 1 ]] || [[ $(echo "2.8<=$champmini&&$champmini<=4" | bc -l) == 1 ]]
	then
		wget http://data.astrometry.net/debian/astrometry-data-4201-1_0.45_all.deb -P /tmp/index/
		wget http://data.astrometry.net/debian/astrometry-data-4202-2_0.45_all.deb -P /tmp/index/
		wget http://data.astrometry.net/debian/astrometry-data-4203-3_0.45_all.deb -P /tmp/index/
		wget http://data.astrometry.net/debian/astrometry-data-4204-4_0.45_all.deb -P /tmp/index/
	fi
	if [[ $(echo "4<=$champmaxi&&$champmaxi<=5.6" | bc -l) == 1 ]] || [[ $(echo "4<=$champmini&&$champmini<=5.6" | bc -l) == 1 ]]
	then
		wget http://data.astrometry.net/debian/astrometry-data-4202_0.45_all.deb -P /tmp/index/
	fi
	if [[ $(echo "5.6<=$champmaxi&&$champmaxi<=8" | bc -l) == 1 ]] || [[ $(echo "5.6<=$champmini&&$champmini<=8" | bc -l) == 1 ]]
	then
		wget http://data.astrometry.net/debian/astrometry-data-4203_0.45_all.deb -P /tmp/index/
	fi
	if [[ $(echo "8<=$champmaxi&&$champmaxi<=11" | bc -l) == 1 ]] || [[ $(echo "8<=$champmini&&$champmini<=11" | bc -l) == 1 ]]
	then
		wget http://data.astrometry.net/debian/astrometry-data-4204_0.45_all.deb -P /tmp/index/
	fi
	if [[ $(echo "11<=$champmaxi&&$champmaxi<=16" | bc -l) == 1 ]] || [[ $(echo "11<=$champmini&&$champmini<=16" | bc -l) == 1 ]]
	then
		wget http://data.astrometry.net/debian/astrometry-data-4205_0.45_all.deb -P /tmp/index/
	fi
	if [[ $(echo "16<=$champmaxi&&$champmaxi<=22" | bc -l) == 1 ]] || [[ $(echo "16<=$champmini&&$champmini<=22" | bc -l) == 1 ]]
	then
		wget http://data.astrometry.net/debian/astrometry-data-4206_0.45_all.deb -P /tmp/index/
	fi
	if [[ $(echo "22<=$champmaxi&&$champmaxi<=30" | bc -l) == 1 ]] || [[ $(echo "22<=$champmini&&$champmini<=30" | bc -l) == 1 ]]
	then
		wget http://data.astrometry.net/debian/astrometry-data-4207_0.45_all.deb -P /tmp/index/
	fi
	if [[ $(echo "30<=$champmaxi&&$champmaxi<=2000" | bc -l) == 1 ]] || [[ $(echo "30<=$champmini&&$champmini<=2000" | bc -l) == 1 ]]
	then
		wget http://data.astrometry.net/debian/astrometry-data-4208-4219_0.45_all.deb -P /tmp/index/
	fi
	sudo dpkg -i /tmp/index/astrometry-data-*.deb
fi
#
#################
# fin de script #
#################
#

