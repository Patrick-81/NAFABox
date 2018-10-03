################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On Sept 02 2018
# V0.1
################################################


cd ./ConfigTinker
source ./pwd_ConfigTinker.sh
echo $dirinstall
chmod +x ./*
echo "start NAFABOX installation"
./install_conf.sh | tee -a "$dirinstall/nafabox.log"

