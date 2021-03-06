#!/bin/bash

chmod +x 2_base.sh
sh ./2_base.sh

echo "Installing Xorg"
sudo pacman -S --noconfirm xorg

echo "Installing Plasma and common applications"
sudo pacman -S --noconfirm plasma ark dolphin dolphin-plugins gwenview kate kgpg konsole kwalletmanager okular spectacle kscreen plasma-browser-integration kcalc filelight partitionmanager krunner kfind

echo "Adding Thunderbolt frontend"
sudo pacman -S --noconfirm plasma-thunderbolt

echo "Installing Plasma wayland session"
sudo pacman -S --noconfirm plasma-wayland-session

echo "Installing SDDM and SDDM-KCM"
sudo pacman -S --noconfirm sddm sddm-kcm
sudo systemctl enable sddm

echo "Improving multimedia support"
sudo pacman -S --noconfirm phonon-qt5-vlc

echo "Disabling baloo (file indexer)"
balooctl suspend
balooctl disable

echo "Improving KDE/GTK integration"
sudo pacman -S --noconfirm xdg-desktop-portal xdg-desktop-portal-kde breeze-gtk kde-gtk-config

echo "Downloading wallpaper"
mkdir -p ~/Pictures/wallpapers
wget -P ~/Pictures/wallpapers/ https://raw.githubusercontent.com/gjpin/arch-linux/master/images/wallpapers/Viktor_Forgacs.jpg

echo "Downloading custom shortcuts scheme"
wget -P ~/Downloads/ https://raw.githubusercontent.com/gjpin/arch-linux/master/dotfiles/plasma/kde_plasma_shortcuts_scheme.kksrc

echo "Setting Firefox Breeze theme"
flatpak override --user --env=GTK_THEME=Breeze org.mozilla.firefox

echo "Your setup is ready. You can reboot now!"
