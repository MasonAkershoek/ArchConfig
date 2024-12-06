#!/bin/bash

# Intro
echo "Welcome to masons arch linux install script!"
echo ""

# Window manager and Desktop Environment
sudo pacman -S hyprland wayland sddm networkmanager bluez bluez-utils blueman
sudo systemctl enable sddm
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth

# Graphics drivers choice

echo "What graphics driver do you want to install?"
read -p "[i]ntel, [n]vidia, [a]md: " ans

if [ "$ans" == "i" ]; then
  sudo pacman -S xf86-video-intel
elif [ "$ans" == "n" ]; then
  sudo pacman -S nvidia nvidia-utils
elif [ "$ans" == "a" ]; then
  sudo pacman -S xf86-video-ati
fi
  

# terminal stuff
sudo pacman -S cowsay fortune-mod figlet htop neofetch sl sshfs zsh pipewire github-cli

# extra hyprland stuff
sudo pacman -S kitty swaync xdg-desktop-portal-hyprland hyprlock waybar hyprpaper wofi hypridle hyprpicker

# GUI apps
sudo pacman -S firefox discord steam prismlauncher qbittorrent

# Coding stuff
sudo pacman -S ranger neovim jre-openjdk love lua python3

#mis
sudo pacman -S qt5-wayland qt6-wayland swww w3m ttf-hack ttf-font-awesome man-db man-pages bitwarden

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

zsh

# yay stuff

sudo pacman -Syyu
sudo pacman -S --needed base-devel git

mkdir ~/userapps
cd ~/userapps
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S uwsm hyprpolkitagent wlogout qman-git visual-studio-code-bin

echo "if uwsm check may-start && uwsm select; then
	exec systemd-cat -t uwsm_start uwsm start default
fi" >> ~/.zshrc

