#!/bin/bash

echo "<<<---Starting Application Setup Script Now--->>> "

#Nvidi-Driver install
echo  -n "Do you Want To Install the NVIDIA Drivers ? 'y' or 'n' : "

read -r NVIDIA

if [["$NVIDIA" == "yes" || "$NVIDIA" == "y" || "$NVIDIA" == "Y"]]
then
    sudo apt install nvidia-driver
fi

#FLATPAK setup
echo "Setting up flatpak now:"

sudo apt install flatpak -y
# sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Programs now:"
sudo apt-get install android-tools-adb android-tools-fastboot
# Installing Essential Programs 
apt install feh kitty rofi picom nitrogen lxpolkit x11-xserver-utils unzip wget curl pulseaudio pavucontrol -y
# Installing Other Programs
apt install psmisc unzip tar 7zip mangohud vlc mpv celluloid neovim vim neofetch cpufetch lxappearance fonts-noto-color-emoji -y

echo "XXX--- Exiting Application Setup Script Now ---XXX "
