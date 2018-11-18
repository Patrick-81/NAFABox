################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On Sept 02 2018
# V0.1
################################################
#!/bin/bash -i

if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
else
	sudo apt update
	figlet -k NAFABox
	echo "================================================="
	echo "================================================="

	$nafabox_path/install_conf.sh | tee -a "$nafabox_path/nafabox.log"
fi
