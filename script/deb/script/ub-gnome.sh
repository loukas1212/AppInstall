#!/bin/bash

# installation de git et installation de l'aur yay

echo "installation des application dans 5 seconde.. ( pour annuler l'installation des applications, fermer le terminal )"
echo "5"
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
clear

# installation des applications avec pacman sur l'os
echo "installation des apps pacman.."
sudo apt install -y firefox
sudo apt install -y htop
sudo apt install -y btop
sudo apt install -y vlc
sudo apt install -y bash-completion
sudo apt install -y openssh-server
sudo apt install -y neofetch
sudo apt install -y fastfetch
sudo apt install -y virt-manager
sudo apt install -y docker.io
sudo apt install -y obs-studio
sudo apt install -y gnome-disk-utility
sudo apt install -y virtualbox

clear
sleep 1 

# installation des application flatpak sur l'os
flatpak install -y flathub com.visualstudio.code
flatpak install -y flathub dev.vencord.Vesktop
flatpak install -y flathub com.mattjakeman.ExtensionManager
flatpak install -y flathub net.codelogistics.clicker
flatpak install -y flathub org.prismlauncher.PrismLauncher
flatpak install -y flathub com.brave.Browser
flatpak install -y flathub io.github.shiftey.Desktop
flatpak install -y flathub page.codeberg.libre_menu_editor.LibreMenuEditor
flatpak install -y flathub com.discordapp.Discord

clear

sleep 5

# installation des application en .deb
cd deb
sudo apt install -y *.deb


# Reboot et fin du script
echo "toute les application sont installer, redémarrage dans 3 seconde !"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
reboot
