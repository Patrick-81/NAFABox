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
    # for bionic : 
    sudo apt-get -y install libdc1394-22-dev
    # for bionic focal :
    sudo apt-get -y install libsdl-dev qt5-default
    # for focal jammy :
    sudo apt-get -y install libdc1394-dev libsdl1.2-dev libudev1
    sudo apt-get -y install libv4l-dev libcfitsio-dev libudev-dev libtiff-dev gawk gcc g++ yasm autoconf autoconf-archive libtool m4 automake libevent-dev pkg-config make
    sudo apt-get -y install libhidapi-dev libpng-dev libusb-dev libusb-1.0 libftdi-dev libraw-dev libraw1394-11 libgtkmm-2.4-1v5 libglademm-2.4-1v5 libgtkglextmm-x11-1.2-dev libgtkglextmm-x11-1.2 fxload 
    sudo apt-get -y install qtbase5-dev qttools5-dev-tools qtchooser qt5-qmake qtbase5-dev-tools
    sudo apt-get -y install libuvc-dev gawk libv4l2rds0 libavcodec-dev libbz2-dev libavformat-dev libavutil-dev libftdi-dev
    sudo apt-get -y install libcfitsio-dev libftdi-dev libavcodec-dev libavformat-dev libavdevice-dev libavfilter-dev yasm
    sudo apt-get -y install ffmpeg libftdi1-dev
    # need add altaircamlegacy and omegonprocam
    
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
	
	echo "autoconf oacapture"
        # config openastro
        # set -x -e
        # autoreconf -fvi

        # config libusb
	# echo "autoconf libusb"
        # cd ./ext/libusb
        # autoreconf -ivf

        # config libdc1394
	# echo "autoconf libdc1394"
        # cd ..
        # cd libdc1394
        # autoreconf -fvi

        # config libhidapi
	# echo "autoconf libhidapi"
        # cd ..
        # cd libhidapi
        # autoreconf -ivf
        # cd ../../

        #install openastro
	echo "compile oacature ... wait"
        ./configure
        make
        sudo make install
	echo "compile oacature finish"
	
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
        oa_version="1.8.0-1"
        date_ver="2019/05"
        if [[ ${proc} == "_amd64" ]]
        then
            platform="amd64"
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libaltaircam_1.39.15364-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libaltaircamlegacy_1.24.11330-2_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libasicamera_1.16-0_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libefwfilter_1.5.0615-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libmallincam_1.43.15988-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libnncam_1.46.16709-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libomegonprocam_1.39.15325-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libqhyccd_20.8.26.3-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libstarshootg_1.46.16627-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libtoupcam_1.48.18042-1_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libuvc_0.0.6-2openastro4_${platform}deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/qhy-firmware_20.8.26.3-1_all.deb -P /tmp
	    
            sudo apt-get -y install /tmp/libaltaircam_1.39.15364-1_${platform}.deb
            sudo apt-get -y install /tmp/libaltaircamlegacy_1.24.11330-2_${platform}.deb
            sudo apt-get -y install /tmp/libasicamera_1.16-0_${platform}.deb
            sudo apt-get -y install /tmp/libefwfilter_1.5.0615-1_${platform}.deb
            sudo apt-get -y install /tmp/libmallincam_1.43.15988-1_${platform}.deb
            sudo apt-get -y install /tmp/libnncam_1.46.16709-1_${platform}.deb
            sudo apt-get -y install /tmp/libomegonprocam_1.39.15325-1_${platform}.deb
            sudo apt-get -y install /tmp/libqhyccd_20.8.26.3-1_${platform}.deb
            sudo apt-get -y install /tmp/libstarshootg_1.46.16627-1_${platform}.deb
            sudo apt-get -y install /tmp/libtoupcam_1.48.18042-1_${platform}.deb
            sudo apt-get -y install /tmp/libuvc_0.0.6-2openastro4_${platform}deb
            sudo apt-get -y install /tmp/qhy-firmware_20.8.26.3-1_all.deb

        elif [[ ${proc} == "_armhf" ]]
        then
            platform="armhf"
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libaltaircam_1.47.17497-1_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libasicamera_1.16-0_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libefwfilter_1.5.0615-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libmallincam_1.43.15988-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libnncam_1.46.16709-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libomegonprocam_1.39.15325-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libqhyccd_20.8.26.3-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libstarshootg_1.46.16627-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libtoupcam_1.48.18042-1_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libuvc_0.0.6-2openastro4_${platform}deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/qhy-firmware_20.8.26.3-1_all.deb -P /tmp
	    
            sudo apt-get -y install /tmp/libaltaircam_1.39.15364-1_${platform}.deb
            sudo apt-get -y install /tmp/libasicamera_1.16-0_${platform}.deb
            sudo apt-get -y install /tmp/libefwfilter_1.5.0615-1_${platform}.deb
            sudo apt-get -y install /tmp/libmallincam_1.43.15988-1_${platform}.deb
            sudo apt-get -y install /tmp/libnncam_1.46.16709-1_${platform}.deb
            sudo apt-get -y install /tmp/libomegonprocam_1.39.15325-1_${platform}.deb
            sudo apt-get -y install /tmp/libqhyccd_20.8.26.3-1_${platform}.deb
            sudo apt-get -y install /tmp/libstarshootg_1.46.16627-1_${platform}.deb
            sudo apt-get -y install /tmp/libtoupcam_1.48.18042-1_${platform}.deb
            sudo apt-get -y install /tmp/libuvc_0.0.6-2openastro4_${platform}deb
            sudo apt-get -y install /tmp/qhy-firmware_20.8.26.3-1_all.deb

        elif [[ ${proc} == "_aarch64" ]]
        then
	    platform="arm64"
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libaltaircam_1.47.17497-1_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libasicamera_1.16-0_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libefwfilter_1.5.0615-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libmallincam_1.43.15988-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libnncam_1.46.16709-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libomegonprocam_1.39.15325-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libqhyccd_20.8.26.3-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libstarshootg_1.46.16627-1_${platform}.deb -P /tmp
	    wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libtoupcam_1.48.18042-1_${platform}.deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/libuvc_0.0.6-2openastro4_${platform}deb -P /tmp
            wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/qhy-firmware_20.8.26.3-1_all.deb -P /tmp
	    
            sudo apt-get -y install /tmp/libaltaircam_1.39.15364-1_${platform}.deb
            sudo apt-get -y install /tmp/libasicamera_1.16-0_${platform}.deb
            sudo apt-get -y install /tmp/libefwfilter_1.5.0615-1_${platform}.deb
            sudo apt-get -y install /tmp/libmallincam_1.43.15988-1_${platform}.deb
            sudo apt-get -y install /tmp/libnncam_1.46.16709-1_${platform}.deb
            sudo apt-get -y install /tmp/libomegonprocam_1.39.15325-1_${platform}.deb
            sudo apt-get -y install /tmp/libqhyccd_20.8.26.3-1_${platform}.deb
            sudo apt-get -y install /tmp/libstarshootg_1.46.16627-1_${platform}.deb
            sudo apt-get -y install /tmp/libtoupcam_1.48.18042-1_${platform}.deb
            sudo apt-get -y install /tmp/libuvc_0.0.6-2openastro4_${platform}deb
            sudo apt-get -y install /tmp/qhy-firmware_20.8.26.3-1_all.deb

        fi

        wget http://www.openastroproject.org/wp-content/uploads/${date_ver}/ubuntu-20.04-${platform}/oacapture_${oa_version}_${platform}.deb -P /tmp
        sudo apt-get -y install /tmp/oacapture_${oa_version}_${platform}.deb
    fi

else
    echo "Install indi-full first !"
    exit
fi
