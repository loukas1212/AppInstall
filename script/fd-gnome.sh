#!/bin/bash

# installation de git et autres apps

echo "Installation des applications dans 5 secondes... (Pour annuler, fermez le terminal)"
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

# Installation des applications avec DNF
echo "Installation des apps via dnf..."
sudo dnf install -y firefox
sudo dnf install -y htop
sudo dnf install -y btop
sudo dnf install -y vlc
sudo dnf install -y bash-completion
sudo dnf install -y openssh-server
sudo dnf install -y fastfetch
sudo dnf install -y virt-manager
sudo dnf install -y docker
sudo dnf install -y obs-studio
sudo dnf install -y gnome-disk-utility
sudo dnf install -y VirtualBox

clear
sleep 1

# Installation des applications Flatpak
echo "Installation des apps via Flatpak..."
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

# Installation des fichiers RPM si présents
echo "Installation des fichiers .rpm trouvés dans le dossier..."
cd rpm
sudo dnf install -y *.rpm

# Redémarrage et fin
echo "Toutes les applications sont installées. Redémarrage dans 3 secondes..."
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
reboot
