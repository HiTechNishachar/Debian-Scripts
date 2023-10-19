#! /bin/bash

echo "#########################################################"

echo "Please BACKUP ALL your DATA BEFORE you start the script !!!"

echo "#########################################################"

echo "Are you Ready ?"

echo "Update / Upgrade the System First :"

sudo apt update && sudo apt dist-upgrade && sudo apt autoremove -y

echo  -n "Do you Want To Install the NVIDIA Drivers ? 'y' or 'n' : "

read -r NVIDIA

if [["$NVIDIA" == "yes" || "$NVIDIA" == "y" || "$NVIDIA" == "Y"]]
then
    sudo apt install nvidia-driver
fi

echo "Install FLATPAK :"

sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo



# echo "Remove ALL the Gnome-Games "

# sudo apt purge gnome-2048 aisleriot atomix gnome-chess five-or-more hitori iagno gnome-klotski lightsoff gnome-mahjongg gnome-mines gnome-nibbles quadrapassel four-in-a-row gnome-robots gnome-sudoku swell-foop tali gnome-taquin gnome-tetravex -y & sudo apt autoremove -y

echo "Remove ALL the KDE PIM packages : "

sudo apt purge akonadi* -y && sudo apt autoremove -y

echo "Remove the FIREFOX ESR version , Konqueror and Transmission : "

sudo apt purge firefox-esr konqueror transmission -y && sudo apt autoremove -y

echo "Remove the cheese, Dragon Player, JuK , gnome-music , Libre Office and Evolution : "

sudo apt purge cheese dragonplayer juk gnome-music  libreoffice evolution libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-writer -y  && sudo apt autoremove -y

echo "Install VLC and mpv :"

sudo apt install vlc mpv -y

# echo "Installing Software form FLATPAK :"

# echo "Install Firefox : "

# flatpak install flathub org.mozilla.firefox -y

# echo "Install OnlyOffice : "

# flatpak install flathub org.onlyoffice.desktopeditors -y


# echo  -n " Do you want to install Wine-Staging for Gaming and Windows emulation ? 'y' or 'n'  : "

# read -r WINE

# if [["$WINE" == "y" || "$WINE" == "yes"]]
# then
#     sudo dpkg --add-architecture i386

#     sudo mkdir -pm755 /etc/apt/keyrings

#     sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

#     sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources

#     sudo apt update

#     sudo apt install --install-recommends winehq-staging -y

# fi


# echo -n "Do You Want To Install Steam and Lutris for some Gaming ? 'y' or 'n' :  "

# read -r GAME

# if [["$GAME" == "y" || "$GAME" == "yes" || "$GAME" == "Y"]]
# then
#      flatpak install flathub com.valvesoftware.Steam -y

#      flatpak install flathub net.lutris.Lutris -y

# fi

# echo "Install Kdenlive :"

# flatpak install flathub org.kde.kdenlive -y

# echo "Install Obs Studio :"

# flatpak install flathub com.obsproject.Studio -y

# echo "Install Audacity :"

# flatpak install flathub org.audacityteam.Audacity -y

# echo "Install VS CODE :"

# flatpak install flathub com.visualstudio.code -y



# Titus script

#!/bin/bash

# Check if Script is Run as Root
# if [[ $EUID -ne 0 ]]; then
#   echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
#   exit 1
# fi

# username=$(id -u -n 1000)
# builddir=$(pwd)

# # Update packages list and update system
# apt update
# apt upgrade -y

# # Install apt
# apt install apt -y

# Making .config and Moving config files and background to Pictures
cd $builddir
# mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts
mkdir -p /home/$username/Pictures
mkdir -p /home/$username/Pictures/backgrounds
# cp -R dotconfig/* /home/$username/.config/
cp bg.jpg /home/$username/Pictures/backgrounds/
mv user-dirs.dirs /home/$username/.config
chown -R $username:$username /home/$username

# Installing Essential Programs 
apt install feh kitty rofi picom nitrogen lxpolkit x11-xserver-utils unzip wget curl pulseaudio pavucontrol build-essential libx11-dev libxft-dev libxinerama-dev -y
# Installing Other less important Programs
apt install neofetch cpufetch psmisc mangohud vim lxappearance lxappearance fonts-noto-color-emoji -y

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

# # Install brave-browser
# apt install apt-transport-https curl -y
# curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
# echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
# apt update
# apt install brave-browser -y

# # Enable graphical login and change target from CLI to GUI
# systemctl enable lightdm
# systemctl set-default graphical.target

# # Beautiful bash
# git clone https://github.com/ChrisTitusTech/mybash
# cd mybash
# bash setup.sh
# cd $builddir

# # Use apt
# bash scripts/useapt

echo "##################"

echo "You Are Ready !!!"

echo "##################"

echo "Please REBOOT NOW !!!"

echo "##################"