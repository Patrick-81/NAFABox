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
	echo "export nafabox_path=$`pwd`"  >> ~/.bashrc
	echo -e "nafabox_path was added"
fi
