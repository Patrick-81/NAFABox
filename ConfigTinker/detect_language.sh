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
# Detect language
######
lang=$(locale | grep LANG= | grep fr_FR)
if [[ $lang == *"fr_FR"* ]]
then
	french=true
else
	french=false
fi

