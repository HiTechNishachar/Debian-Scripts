#!/bin/bash

#Update
sudo apt update && sudo apt dist-upgrade && sudo apt autoremove -y


#KDE minimal install
./veryminkdedeb.sh

#Nvidi-Driver install
echo  -n "Do you Want To Install the NVIDIA Drivers ? 'y' or 'n' : "

read -r NVIDIA

if [["$NVIDIA" == "yes" || "$NVIDIA" == "y" || "$NVIDIA" == "Y"]]
then
    sudo apt install nvidia-driver
fi

#FLATPAK setup
echo "Install FLATPAK :"

sudo apt install flatpak -y
# sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Remove bloat if found
echo "Remove ALL the KDE PIM packages : "

sudo apt purge akonadi* -y && sudo apt autoremove -y

echo "Remove the FIREFOX ESR version , Konqueror and Transmission : "

sudo apt purge firefox-esr konqueror transmission -y && sudo apt autoremove -y

echo "Remove the cheese, Dragon Player, JuK , gnome-music , Libre Office and Evolution : "

sudo apt purge cheese dragonplayer juk gnome-music  libreoffice evolution libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-writer -y  && sudo apt autoremove -y


#Setup fonts programs themes wallpapers

echo "Setup fonts programs themes wallpapers : "
cd $builddir
# mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/Pictures
mkdir -p /home/$username/Pictures/backgrounds
# cp -R dotconfig/* /home/$username/.config/
# cp bg.jpg /home/$username/Pictures/backgrounds/
mv user-dirs.dirs /home/$username/.config
chown -R $username:$username /home/$username
cd /home/$username/Pictures/backgrounds/
git clone https://gitlab.com/dwt1/wallpapers
mv /wallpapers/* ../*

# Installing Essential Programs 
apt install feh kitty rofi picom nitrogen lxpolkit x11-xserver-utils unzip wget curl pulseaudio pavucontrol -y
# Installing Other less important Programs
apt install neofetch cpufetch psmisc mangohud vim neovim lxappearance fonts-noto-color-emoji -y

# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Installing fonts
cd $builddir 
apt install fonts-font-awesome -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /home/$username/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d /home/$username/.fonts
mv dotfonts/fontawesome/otfs/*.otf /home/$username/.fonts/
chown $username:$username /home/$username/.fonts/*

# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

# Install Nordzy cursor
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd $builddir
rm -rf Nordzy-cursors