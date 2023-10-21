#!/bin/bash

set -x;

apt-get update -yq

packages=(
  # can I haz sandwich?
  aspell-en
  hunspell-en-us
  hyphen-en-us

  # Apps
  ark
  neofetch
  ffmpeg
  dolphin
  kate
  kde-spectacle
  kmenuedit
  konsole
  vlc
  celluloid
  neovim
  vim
  neofetch
  cpufetch
  okular
  qml-module-org-kde-newstuff
  systemsettings

  # Services
  bluedevil
  khotkeys
  kscreen
  kwalletmanager
  plasma-nm
  plasma-pa
  powerdevil
  polkit-kde-agent-1
  upower

  # DE
  kwin-x11
  plasma-desktop
  plasma-workspace
  sddm
  xorg

  # Theming
  breeze-gtk-theme
  kde-config-gtk-style
  kde-config-gtk-style-preview
  sddm-theme-breeze

  # Libs and Plugins
  libqtspell-qt5-1
  qtvirtualkeyboard-plugin
  plasma-browser-integration
  plasma-runners-addons
  pulseaudio-module-bluetooth
  build-essential 
  libx11-dev 
  libxft-dev 
  libxinerama-dev

  # Ark tooling
  unzip
  tar
  7zip 
)

arguments=(
   -y
   -q
  --no-install-recommends
)

apt-get install "${arguments[@]}" "${packages[@]}"
