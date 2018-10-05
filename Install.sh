################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# 			
# On Sept 02 2018
# V0.1
################################################
#!/bin/bash -i

sudo apt update
figlet -k NAFABox
echo "================================================="
echo "================================================="

$nafabox_path/install_conf.sh | tee -a "$nafabox_path/nafabox.log"

