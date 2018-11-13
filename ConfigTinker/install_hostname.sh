################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# On June 10 2017
# V0.1
# v0.2  ajout de browsepy (Patrick Dutoit)
################################################
#!/bin/bash -i
######
# Recherche du répertoire ConfigTinker
######
if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=$nafabox_path

figlet -k Install Hostname
echo "================================================="
echo "================================================="

if name=`yad --width=300 \
			--center \
			--form \
			--title="Choose your HostName :" \
			--text="Chose your HostName (no special character):" \
			--field="HostName:" "NAFABox"`
then
	new_host=$(echo "$name" | cut -d "|" -f1)
	def_host=`cat /etc/hostname`
	sudo echo $new_host > /tmp/hostname
	sudo mv /tmp/hostname /etc/hostname
	cat  /etc/hosts | sed -e "s=$def_host=$new_host=g" > /tmp/hosts
	sudo mv /tmp/hosts /etc/hosts
	echo "hostname change for $new_host"
else
	echo "hostname not change"
fi
