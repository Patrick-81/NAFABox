################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On Sept 02 2018
# V0.1
################################################

sudo apt install figlet
cd ./ConfigTinker
source ./pwd_ConfigTinker.sh
echo $dirinstall
chmod +x ./*
figlet -k NAFABox
echo "================================================="
echo "================================================="

./install_conf.sh | tee -a "$dirinstall/nafabox.log"

