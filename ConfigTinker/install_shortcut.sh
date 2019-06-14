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
# Recherche du répertoire ConfigTinker
######
if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=${nafabox_path}
######
source ${dirinstall}/detect_language.sh
######
# Créer le raccourci bureau
######
terminal='true'
AppExec=''
AppName=''
option='0' # defaut en cas d'oubli
for ARGUMENT in "$@"
do

    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   

    case "$KEY" in
            APPNAME)  AppName=${VALUE} ;;
            APPEXEC)  AppExec=${VALUE} ;;
			TERMINAL) terminal=${VALUE};;
			OPTION)   option=${VALUE};;  
            *)   
    esac    
done
if test -z "${AppExec}"
then
	AppExec=$AppName
fi
######
if [[ -d ~/Desktop ]]
then
	desktop="Desktop"
else
	desktop="Bureau"
fi
######
# Caps on first letter of AppName
AppIcon=$AppName
AppName=$(echo $AppName | sed 's/^./\u&/')
######
# Nettoyer les résidus d'un précédent appel
rm -f /tmp/shortcut*
rm -f /tmp/${AppName}.desktop
######
num=1
cat ${dirinstall}/template.desktop  | sed -e "s/APP_NAME/$AppName/g" | sed -e "s%APP_EXEC%$AppExec%g" | sed -e "s/NAME/$AppName/g" | sed -e "s/TERMOP/$terminal/g" | sed -e "s/APP_ICON/$AppIcon/g" > /tmp/${AppName}.desktop
chmod +x /tmp/${AppName}.desktop
<<<<<<< HEAD

case ${option} in
"0")
   sudo cp /tmp/${AppName}.desktop /usr/share/applications/${AppName}.desktop
"1")
   sudo cp /tmp/${AppName}.desktop ~/${desktop}/${AppName}.desktop
   ;;
"2")
   sudo cp /tmp/${AppName}.desktop ~/${desktop}/${AppName}.desktop
   sudo cp ~/${desktop}/${AppName}.desktop /usr/share/applications/${AppName}.desktop
   ;;
esac
sudo rm /tmp/${AppName}.desktop


#if [[ -n ${option} ]]
#then
#	if [[ ${option} == "1" ]]
#	then
#	elif [[ ${option} == "0" ]]
#	then
#		mv /tmp/${AppName}.desktop ~/${desktop}/${AppName}.desktop
#	else
#		mv /tmp/${AppName}.desktop ~/${desktop}/${AppName}.desktop
#   	sudo cp ~/${desktop}/${AppName}.desktop /usr/share/applications/${AppName}.desktop
#	fi
#fi
=======

if [[ -n ${option} ]]
then
	if [[ ${option} == "1" ]]
	then
		sudo mv /tmp/${AppName}.desktop /usr/share/applications/${AppName}.desktop
	elif [[ ${option} == "0" ]]
	then
		mv /tmp/${AppName}.desktop ~/${desktop}/${AppName}.desktop
    fi
else
	mv /tmp/${AppName}.desktop ~/${desktop}/${AppName}.desktop
    sudo cp ~/${desktop}/${AppName}.desktop /usr/share/applications/${AppName}.desktop
fi
>>>>>>> 08e28fa51e07bdafbd2f02d8628108a6c9243f6c
