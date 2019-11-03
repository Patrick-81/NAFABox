################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On Sept 02 2018
# V0.1
################################################
#!/bin/bash -i

if [[ -f "./temp_directory.tmp" ]]
then
	rm ./temp_directory.tmp
fi

fichtemp=`tempfile 2>/dev/null` || fichtemp=/tmp/test$$
error=`tempfile 2>/dev/null` || fichtemp=/tmp/error$$
zenity  --file-selection \
		--title="Select ConfigTinker Folder" \
		--file-filter=""ConfigTinker"" \
		--directory 1>${fichtemp} 2>${error}

ConfigTinker_path=$(cat ${fichtemp})
if test "$ConfigTinker_path" = ""
then 
	echo "Pas de fichier pour NAFABOX Détecté."
fi

dirinstall=${ConfigTinker_path}

echo ''${dirinstall}''>> ${dirinstall}/temp_directory.tmp
