#!/bin/bash

echo "<<<---Starting Looks Setup Script Now--->>> "

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

echo "Download wallpapers : "

git clone https://gitlab.com/dwt1/wallpapers
mkdir /home/$username/Pictures/backgrounds/DT-Wallpapers
mv /wallpapers/* /home/$username/Pictures/backgrounds/DT-Wallpapers
sudo rm -rf /wallpapers

git clone https://github.com/ChrisTitusTech/nord-background
mkdir /home/$username/Pictures/backgrounds/CTT-Nord-Backgrounds
mv /nord-background/* /home/$username/Pictures/backgrounds/CTT-Nord-Backgrounds
sudo rm -rf /nord-background


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

echo "XXX--- Exiting Looks Setup Script Now ---XXX "