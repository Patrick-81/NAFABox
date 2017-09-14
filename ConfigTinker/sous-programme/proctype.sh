################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
p=$(uname -p)
case $p in
"armv7l") 
	proc="_armhf"
	;;
"x86_64")
	proc="_amd64"
	;;
esac
