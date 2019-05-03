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
echo $1 $2 $3

if [[ -n "$2"  ]]
then
    if [[ $2 == "0" ]] || [[ $2 == "1" ]]
    then
	    AppExec=$1
    else
        AppExec=$2
    fi
else
	AppExec=$1
fi

if [[ -d ~/Desktop ]]
then
	desktop="Desktop"
else
	desktop="Bureau"
fi
######
AppName=$(echo $1 | sed 's/^./\u&/')

rm -f /tmp/shortcut1
rm -f /tmp/shortcut2
rm -f /tmp/${AppName}.desktop

cat ${dirinstall}/template.desktop  | sed -e "s/APP_NAME/$1/g" > /tmp/shortcut1
cat /tmp/shortcut1  | sed -e "s%APP_EXEC%$AppExec%g" > /tmp/shortcut2
cat /tmp/shortcut2 | sed -e "s/NAME/$AppName/g" > /tmp/${AppName}.desktop
chmod +x /tmp/${AppName}.desktop

option="rien"
if [[ -n "$3"  ]]
then
    if [[ $3 == "0" ]] || [[ $3 == "1" ]]
    then
        option=$3
    fi
else
    if [[ -n "$2"  ]]
    then
        if [[ $2 == "0" ]] || [[ $2 == "1" ]]
        then
            option=$2
        fi
    fi
fi
    

if [[ ${option} == "1" ]]
then
	sudo mv /tmp/${AppName}.desktop /usr/share/applications/${AppName}.desktop
elif [[ ${option} == "0" ]]
then
	mv /tmp/${AppName}.desktop ~/${desktop}/${AppName}.desktop

else
	mv /tmp/${AppName}.desktop ~/${desktop}/${AppName}.desktop
    sudo cp ~/${desktop}/${AppName}.desktop /usr/share/applications/${AppName}.desktop
fi

