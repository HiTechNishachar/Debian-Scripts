#!/bin/bash

echo "Getting system up to date"
#Update
sudo apt update && sudo apt dist-upgrade && sudo apt autoremove -y


#KDE minimal install
sudo bash ./veryminkdedeb.sh

#KDE minimal install
sudo bash ./appsetup.sh

#KDE minimal install
sudo bash ./lookssetup.sh

#KDE minimal install
sudo bash ./debloat.sh


echo "######################################"

echo "All Set Now, reboot at convenience !!!"

echo "######################################"


echo  -n "Do you wish to restart system? 'y' or 'n' : "

read -r RESTART

if [["$RESTART" == "yes" || "$RESTART" == "y" || "$RESTART" == "Y"]]
then
    sudo reboot
fi
