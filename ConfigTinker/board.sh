################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	Sébastien Durand
# On July 20 2019
# V0.1
################################################
#!/bin/bash -i

machine=$(sudo lshw | grep "produit\|product" | grep "Raspberry")

if [[ -e "/etc/armbian-release" ]]
then
    . /etc/armbian-release
    armbian_board=true
    arm_board_name=$BOARD_NAME
else
    if [[ ${machine} == *"Raspberry"* ]]
    then
        armbian_board=false
        arm_board_name="raspberry"
    else
        armbian_board=false
        arm_board_name="unknown"
    fi
fi