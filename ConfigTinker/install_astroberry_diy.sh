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
#!/bin/bash -i
######
# pre-req
#####
######
# Recherche du répertoire ConfigTinker
######
if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=${nafabox_path}
######

source ${dirinstall}/board.sh

sudo apt-get install --reinstall lshw
mkdir -p /home/${USER}/bin/
cd /home/${USER}/bin/

if ${armbian_board}
then
	echo "GPIO non disponible\n"
else

    figlet -k Install Astroberry-DIY

    sudo apt-get -y install cmake

    # check install indi :
    dpkg -s indi-full &> /dev/null

    if [ $? -eq 0 ]; then
        echo "Indi-full is installed!"
        sudo apt-get -y install libindi-dev


        git clone https://github.com/rkaczorek/astroberry-diy

        # install wiringpi for no raspberry board
        if [[ arm_board_name == "Tinkerboard" ]]
        then
            git clone https://github.com/TinkerBoard/gpio_lib_c
            cd /home/${USER}/bin/gpio_lib_c
            chmod a+x build
            sudo ./build
        elif [[ arm_board_name == "NanoPi" ]]
        then
            # Delete "old" version
            wget http://112.124.9.243:8888/wiringpi/friendlyelec-rk3399/remove_oldversion_wiringPi.sh
            chmod 755 remove_oldversion_wiringPi.sh
            sudo ./remove_oldversion_wiringPi.sh
            # Download and install wiringPi for RK3399
            wget http://112.124.9.243:8888/wiringpi/friendlyelec-rk3399/wiringpi-v2.44-friendlyelec-rk3399.deb
            sudo dpkg -i  wiringpi-v2.44-friendlyelec-rk3399.deb
        fi

        # install astroberry-diy with wiringpi
        cd /home/${USER}/bin/astroberry-diy

        mkdir -p build && cd build

        cmake -DWITH_WIRINGPI=ON -DCMAKE_INSTALL_PREFIX=/usr ..
        make
        sudo make install

    else
        echo "Install indi-full first !"
        exit
    fi
fi


