################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On Sept 02 2018
# V0.1
################################################


source ./ConfigTinker/pwd_configTinker.sh | tee -a "$dirinstall/nafabox.log"
dirinstall=$ConfigTinker_path
cd $dirinstall
chmod +x ./*
echo "start NAFABOX installation"
./install_conf.sh | tee -a "$dirinstall/nafabox.log"

