#!/bin/bash

# Install packages

sudo pacman -Sy

sudo pacman -S --noconfirm archlinux-keyring

sudo pacman -S --noconfirm git \
               go \
               xorg \
               xorg-xinit \
               nemo \
               pulseaudio\
               flameshot\
               feh \
               firefox \
               zsh \
               i3-gaps \
               alacritty \
               noto-fonts \
               noto-fonts-emoji \
               rofi \
               alsa-lib \
               lightdm \
               file-roller \
               ttf-fira-code \
               godot \
               pavucontrol \
               lxappearance \
               linux-headers \
               vagrant \
               terraform \
               ansible \
               virtualbox \
               fakeroot \
               autoconf \
               automake \
               base-devel \
               python3 \
               python-pip \
               xdg-user-dirs \
               linux \
               xf86-video-intel
  

# Install yay

git clone https://aur.archlinux.org/yay && cd yay
makepkg -si
cd ..
rm -rf yay

# Python dependences
sudo pip3 install meson

# Yay packages

yay -S --noconfirm visual-studio-code-bin \
google-chrome \
ncpamixer \
spotify \
lightdm-mini-greeter \
ocs-url \
picom-ibhagwan-git \
polybar

# fetch

git clone https://github.com/Manas140/fetch
sudo cp fetch/fetch /usr/local/bin/fetch
rm -rf fetch

# Default dirs
xdg-user-dirs-update

# Install fonts
mkdir -p ~/.fonts
cp fonts/* ~/.fonts
fc-cache -v -f

#install config files
mv config/* ~/.config

# Install wallpapers
mkdir -p ~/Pictures/Wallpapers
cp wal/* ~/Pictures/Wallpapers

# Start pulseaudio
pulseaudio -D
pulseaudio --start

# Configure light dm theme
sudo rm /etc/lightdm/lightdm-mini-greeter.conf
sudo cp configfiles/lightdm-mini-greeter.conf /etc/lightdm/lightdm-mini-greeter.conf

sudo rm /etc/lightdm/lightdm.conf
sudo cp configfiles/lightdm.conf /etc/lightdm/lightdm.conf

#zsh
cp config/.zshrc ~/.zshrc

#virtualbox module
sudo modprobe vboxdrv

# Configure theme
mkdir -p ~/.icons
cp -r themes/Dracula-cursors ~/.icons

mkdir -p ~/.themes
cp -r themes/Equilux-compact ~/.themes

mkdir -p ~/.config/gtk-3.0/
cp -r config/settings.ini ~/.config/gtk-3.0/

# Systemectl
sudo systemctl enable lightdm

echo "Please, reboot your system"