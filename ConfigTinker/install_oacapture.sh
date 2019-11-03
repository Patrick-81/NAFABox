################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# On Jan 1 2019
# V0.1
################################################
#!/bin/bash -i
######
# Recherche du répertoire ConfigTinker
######
if [[ -z "$nafabox_path" ]]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=${nafabox_path}

figlet -k Install OACapture
echo "================================================="
echo "================================================="

######
# detect processeur
######
source ${dirinstall}/proctype.sh

if [[ ${proc} == "_x86" ]]
then
	echo "OAcapture is not compatible with x86_32bit platform"
	exit
fi

# check install indi :
dpkg -s indi-full &> /dev/null

if [ $? -eq 0 ]; then
    ######
    # Installation des pré-requis
    #######
    sudo apt-get -y install qt4-dev-tools qt4-qmake libqt4-dev
    sudo apt-get -y install libv4l-dev libdc1394-22-dev libcfitsio-dev libudev-dev libtiff-dev gawk gcc g++ yasm autoconf autoconf-archive libtool m4 automake libevent-dev pkg-config libhidapi-dev libpng-dev libsdl-dev libusb-dev libusb-1.0 libftdi-dev libraw-dev libraw1394-11 libgtkmm-2.4-1v5 libglademm-2.4-1v5 libgtkglextmm-x11-1.2-dev libgtkglextmm-x11-1.2 qt5-default fxload qtbase5-dev qttools5-dev-tools
    sudo apt-get -y install libuvc-dev

    mode_install="dev"
    # go at home
    cd /home/${USER}/bin/

    if [[ ${mode_install} == "dev" ]]
    then


        dpkg -s oacapture &> /dev/null
        if [ $? -eq 0 ]; then
            echo "remove oacapture"
            sudo apt-get -y remove oacapture
        fi


        if [[ -d "/home/${USER}/bin/openastro/" ]]
        then
            # mise a jour
            echo "update OACapture git"
            cd /home/${USER}/bin/openastro/
            sudo make uninstall
            sudo make clean
            git pull
        else
            # installation
            echo "install OACapture git"
            git clone https://github.com/openastroproject/openastro.git

        fi

        cd /home/${USER}/bin/openastro/

        # config openastro
        set -x -e
        autoreconf -fvi

        # config libusb
        cd ./ext/libusb
        autoreconf -ivf

        # config libdc1394
        cd ..
        cd libdc1394
        autoreconf -fvi

        # config libhidapi
        cd ..
        cd libhidapi
        autoreconf -ivf
        cd ../../

        #install openastro
        ./configure
        make
        sudo make install

        ######
        # Création de l'icône sur le bureau
        ######
        ${dirinstall}/install_shortcut.sh APPNAME='oacapture' OPTION='1' TERMINAL='false'

        ######
        # Création de l'icône sur le bureau
        ######
        ${dirinstall}/install_shortcut.sh APPNAME='oalive' OPTION='1' TERMINAL='false'

    elif [[ ${mode_install} == "current" ]]
    then

        if [[ -d "/home/${USER}/bin/openastro/" ]]
        then
            # remove dev branch
            echo "remove OACapture git"
            cd /home/${USER}/bin/openastro/
            sudo make uninstall
            sudo make clean
        fi
        oa_version="1.6.0-1"
        date_ver="2019/05"
        if [[ ${proc} == "_amd64" ]]
        then
            platform="amd64"
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libasicamera_1.14.0227-0_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libefwfilter_0.3.1205-3_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libuvc_0.0.6-2openastro3_${platform}deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libtoupcam_1.33.13725-2_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libaltaircam_1.32.13483-1_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/qhy-firmware_4.0.16-0_all.deb -P /tmp

            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libqhyccd_4.0.16-0_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libaltaircamlegacy_1.24.11330-1_${platform}.deb -P /tmp

            sudo dpkg -i /tmp/libasicamera_1.14.0227-0_${platform}.deb
            sudo dpkg -i /tmp/libefwfilter_0.3.1205-3_${platform}.deb
            sudo dpkg -i /tmp/libuvc_0.0.6-2openastro3_${platform}deb
            sudo dpkg -i /tmp/libtoupcam_1.33.13725-2_${platform}.deb
            sudo dpkg -i /tmp/libaltaircam_1.32.13483-1_${platform}.deb
            sudo dpkg -i /tmp/qhy-firmware_4.0.16-0_all.deb
            sudo dpkg -i /tmp/libqhyccd_4.0.16-0_${platform}.deb
            sudo dpkg -i /tmp/libaltaircamlegacy_1.24.11330-1_${platform}.deb

        elif [[ ${proc} == "_armhf" ]]
        then
            platform="armhf"
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libasicamera_1.14.0227-0_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libefwfilter_0.3.1205-3_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libuvc_0.0.6-2openastro3_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libtoupcam_1.33.13725-2_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libaltaircam_1.32.13483-1_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/qhy-firmware_4.0.16-0_all.deb -P /tmp

            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libqhyccd_4.0.16-0_${platform}.deb -P /tmp

            sudo dpkg -i /tmp/libasicamera_1.14.0227-0_${platform}.deb
            sudo dpkg -i /tmp/libefwfilter_0.3.1205-3_${platform}.deb
            sudo dpkg -i /tmp/libuvc_0.0.6-2openastro3_${platform}deb
            sudo dpkg -i /tmp/libtoupcam_1.33.13725-2_${platform}.deb
            sudo dpkg -i /tmp/libaltaircam_1.32.13483-1_${platform}.deb
            sudo dpkg -i /tmp/qhy-firmware_4.0.16-0_all.deb
            sudo dpkg -i /tmp/libqhyccd_4.0.16-0_${platform}.deb

        elif [[ ${proc} == "_aarch64" ]]
        then
            platform="arm64"
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libasicamera_1.14.0227-0_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libefwfilter_0.3.1205-3_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libuvc_0.0.6-2openastro3_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libtoupcam_1.33.13725-2_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/libaltaircam_1.32.13483-1_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-armhf/qhy-firmware_4.0.16-0_all.deb -P /tmp

            sudo dpkg -i /tmp/libasicamera_1.14.0227-0_${platform}.deb
            sudo dpkg -i /tmp/libefwfilter_0.3.1205-3_${platform}.deb
            sudo dpkg -i /tmp/libuvc_0.0.6-2openastro3_${platform}deb
            sudo dpkg -i /tmp/libtoupcam_1.33.13725-2_${platform}.deb
            sudo dpkg -i /tmp/libaltaircam_1.32.13483-1_${platform}.deb
            sudo dpkg -i /tmp/qhy-firmware_4.0.16-0_all.deb

        fi

        wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-18.04-${platform}/oacapture_${oa_version}_${platform}.deb -P /tmp
        sudo dpkg -i /tmp/oacapture_${oa_version}_${platform}.deb
    fi

else
    echo "Install indi-full first !"
    exit
fi
