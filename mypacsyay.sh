#!/bin/bash
# Installer for yay

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
