################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On Sept 02 2018
# V0.1
################################################

if [ -f "./temp_directory.tmp" ]
then
	rm ./temp_directory.tmp
fi

dirinstall=`pwd`

echo ''$dirinstall''>> $dirinstall/temp_directory.tmp
