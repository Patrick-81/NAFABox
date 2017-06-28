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
source detect_language.sh
######
# Créer le raccourci bureau
######
echo $2
if [ -n "$2"  ]; then
	AppExec=$2
else
	AppExec=$1
fi
if [ -d ~/Desktop ]
then
	desktop="Desktop"
else
	desktop="Bureau"
fi
######
fichier=~/$desktop/$AppName.desktop
if [ -f $fichier ]; then
	if $french
	then
   		echo "le fichier $fichier existe"
	else
		echo "file $fichier exists"
	fi
else
	AppName=$(echo $1 | sed 's/^./\u&/')
	cat $dirinstall/template.desktop  | sed -e "s/APP_NAME/$1/g" > /tmp/shortcut1
	cat /tmp/shortcut1  | sed -e "s%APP_EXEC%$AppExec%g" > /tmp/shortcut2
	cat /tmp/shortcut2 | sed -e "s/NAME/$AppName/g" > ~/$desktop/$AppName.desktop
	chmod +x ~/$desktop/$AppName.desktop
fi

