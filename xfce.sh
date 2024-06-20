# xorg display server installation
sudo apt install -y xorg xinit xbacklight xbindkeys xvkbd xinput x11-xserver-utils

# Build-essential.
sudo apt install -y build-essential

# Microcode for Intel/AMD
# sudo apt install -y amd64-microcode
sudo apt install -y intel-microcode

#XFCE packages
sudo apt install -y xfce4 libxfce4ui-utils thunar xfce4-appfinder xfce4-panel xfce4-session xfce4-settings xfce4-terminal xfconf xfdesktop4 xfwm4 xfce4-netload-plugin xfce4-power-manager-data xfce4-sensors-plugin xfce4-genmon-plugin lm-sensors xfce4-clipman

sudo apt install network-manager-gnome network-manager

# Network File Tools/System Events
sudo apt install -y dialog mtools acpi acpid gvfs-backends

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Sound packages (pulseaudio installed prior)
sudo apt install -y alsa-utils volumeicon-alsa pipewire-audio wireplumber pipewire-pulse pipewire-alsa libspa-0.2-bluetooth libspa-0.2-modules libpipewire-0.3-0

systemctl --user --now enable wireplumber.service

sudo apt install -y bluez blueman
sudo systemctl enable bluetooth

# Programs
sudo apt install -y timeshift htop git curl wget unzip tar 7zip

# Install fonts
sudo apt install fonts-font-awesome fonts-powerline fonts-ubuntu fonts-liberation2 fonts-liberation fonts-terminus ttf-mscorefonts-installer fonts-deva fonts-deva-extra


sudo apt install flatpak -y
# sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install LightDM GTK Greeter Settings (lightdm,lightdm-gtk-greeter installs with xfce)

sudo apt install -y lightdm-gtk-greeter-settings
sudo systemctl enable lightdm

# Download Nordic Theme
git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic

