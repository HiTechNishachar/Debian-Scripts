#!/bin/bash

echo "<<<---Starting DEBLOAT Script Now--->>> "

echo "..........DEBLOAT.........."
#Remove bloat if found
echo "Remove ALL the KDE PIM packages : "
sudo apt purge akonadi* -y && sudo apt autoremove -y

echo "Remove the FIREFOX ESR version , Konqueror and Transmission : "
sudo apt purge firefox-esr konqueror transmission -y && sudo apt autoremove -y

echo "Remove the cheese, Dragon Player, JuK , gnome-music , Libre Office and Evolution : "
sudo apt purge cheese dragonplayer juk gnome-music  libreoffice evolution libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-writer -y  && sudo apt autoremove -y

echo "XXX--- Exiting Application Setup Script Now ---XXX "