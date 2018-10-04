################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
#
# Modified: Ludovic Dugue September 08 2017
#
# On June 10 2017
# V0.1
################################################
#/bin/bash -i
######
# pre-req
#####
######
# Recherche du répertoire ConfigTinker
######
dirinstall=$nafabox_path
######
sudo apt install --reinstall lshw
mkdir -p /home/nafa/Projects
cd /home/nafa/Projects
machine=$(sudo lshw | grep "produit\|product" | grep "Intel")
if [[ $machine == *"Intel"* ]]
then
	echo "GPIO non disponible\n"
	exit
fi
machine=$(sudo lshw | grep "produit\|product" | grep "Raspberry")
if [[ $machine == *"Raspberry"* ]]
then 
	git clone -b https://github.com/rkaczorek/astroberry-diy
else
	git clone -b tinkerboard https://github.com/rkaczorek/astroberry-diy
fi	
git clone https://github.com/RPi-Distro/RTIMULib
git clone https://github.com/TinkerBoard/gpio_lib_c 

sudo apt install cmake
sudo apt install libnova-dev
sudo apt install libgps-dev

cd /home/nafa/Projects/gpio_lib_c
chmod +x build
sudo ./build

cd /home/nafa/Projects/RTIMULib/RTIMULib && mkdir -p build && cd build
sudo rm -rf * && cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug .. && sudo make install

cd /home/nafa/Projects/astroberry-diy
#patch CMakeLists.txt -i $dirinstall/CMakeLists.patch -o TEMP
#cp -f TEMP CMakeLists.txt
#patch rpi_focus.cpp -i $dirinstall/rpi_focus.patch -o TEMP
#cp -f TEMP rpi_focus.cpp
#patch rpi_brd.cpp -i $dirinstall/rpi_brd.patch -o TEMP
#cp -f TEMP rpi_brd.cpp
mkdir -p build && cd build
if [[ $machine == *"Raspberry"* ]]
then
	sudo rm -rf * && cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug .. && sudo make install
else
	sudo rm -rf * && cmake -DCMAKE_INSTALL_PREFIX=/usr -DTINKER=1 -DCMAKE_BUILD_TYPE=Debug .. && sudo make install
fi





