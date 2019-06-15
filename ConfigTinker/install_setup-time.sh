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

figlet -k Install Setup_Time
echo "================================================="
echo "================================================="

##### 
# Création du raccourci pour setup_time.sh
######
script="setup_time"
cp ${dirinstall}/${script}.sh ~/bin/.
sudo ln -sf ~/bin/${script}.sh /usr/bin/${script}
sudo cp ${dirinstall}/${script}.png /usr/share/pixmaps/.
${dirinstall}/install_shortcut.sh APPNAME="$script" APPEXEC="bash -ic $script" TERMINAL='true' OPTION='2'

