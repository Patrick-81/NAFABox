################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# On Juin 3 2019
# V0.1
################################################
#!/bin/bash -i
######
# Recherche du répertoire ConfigTinker
######
if [ -z "$nafabox_path" ]
then
	echo "Run first Pre_Install.sh and reload Terminal"
	exit
fi
dirinstall=$nafabox_path

figlet -k Install Mobindi
echo "================================================="
echo "================================================="

######
# Installation des pré-requis
#######
sudo apt-get -y install git cmake zlib1g-dev libcurl4-openssl-dev libgsl-dev libcfitsio-dev libjpeg-dev libpng-dev libcgicc-dev daemontools nginx

# check install indi :
dpkg -s indi-full &> /dev/null

if [ $? -eq 0 ]; then
    echo "Indi-full is installed!"

    sudo apt-get -y install libindi-dev
    # install last nodejs
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install -y nodejs
    sudo apt-get install -y npm
    npm install

    #######
    # clonage mobindi dans ~/bin
    #######
    mkdir -p /home/$USER/bin
    cd /home/$USER/bin
    if [[ -d "/home/$USER/bin/mobindi" ]]
    then
        cd mobindi
        git pull --ff-only
        # install and compil
        ./install.sh --log-dir /var/log/mobindi

    else
        git clone https://github.com/pludov/mobindi.git
        cd mobindi
        # install and compil
        ./install.sh --log-dir /var/log/mobindi
    fi

    #######
    # Scipt de lancement du serveur au login
    #######
    #echo -e '#!/bin/bash'"\ncd /home/$USER/bin/mobindi\n/home/$USER/bin/mobindi/startup.sh &\n" > /home/$USER/bin/mobindi_up.sh
    #chmod +x /home/$USER/bin/mobindi_up.sh
    #echo -e "[Desktop Entry]
    #Encoding=UTF-8
    #Version=1.1.0
    #Type=Application
    #Name=UI_Indi
    #Comment=Contrôle de Indi
    #Exec=/home/$USER/bin/mobindi_up.sh
    #StartupNotify=false
    #Terminal=false
    #Hidden=false" > /home/$USER/.config/autostart/mobindi.desktop
    #chmod +x /home/$USER/.config/autostart/mobindi.desktop
    
    dir=/etc/systemd/system   #mettre le chemin du service en memoire
    MOI=${USER}

    sudo updatedb     # mettre à jour la base d'indexation

    dir_mobindi="/home/$USER/bin/mobindi/startup.sh"  #récupérer le chemin du binaire browsepy

    echo -e '[Unit]\nDescription=MobIndi\nAfter=multi-user.target\n\n[Service]\nType=idle\nUser='${MOI}'\nExecStart='${dir_mobindi}'\nRestart=always\nRestartSec=5\n[Install]\nWantedBy=multi-user.target' >> /tmp/mobindi.service

    sudo cp /tmp/mobindi.service ${dir}/
    sudo rm /tmp/mobindi.service
    sudo chmod 644 ${dir}/mobindi.service

    ######
    # enregistrer/lancer le service
    ######

    sudo systemctl daemon-reload
    sudo systemctl enable mobindi.service  
    
else
    echo "Indi-full is NOT installed!"
fi
