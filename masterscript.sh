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


echo "##############################"

echo "All Set Now, rebooting NOW !!!"

echo "##############################"

sudo reboot