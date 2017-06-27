################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Patrick Dutoit
# 			Laurent Roge
# On June 10 2017
# V0.1
################################################
#!/bin/bash
dirinstall=$(find ~ -name ConfigTinker)
cd $dirinstall
chmod +x ./*
./install_conf.sh

