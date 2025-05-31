#!/bin/bash

# Fenêtre de compte à rebours avec Zenity
(
    for i in {5..1}; do
        echo "$(( (5 - i) * 20 ))"
        echo "# L'installation commence dans $i secondes..."
        sleep 1
    done
    echo "100"
    echo "# Lancement de l'installation..."
) | zenity --progress \
    --title="Installation en cours" \
    --percentage=0 \
    --auto-close \
    --width=400

# Demander le mot de passe via Zenity
PASSWORD=$(zenity --password --title="Mot de passe administrateur" --width=400)

# Fonction pour exécuter une commande avec sudo en utilisant le mot de passe
run_sudo_command() {
    echo "$PASSWORD" | sudo -S bash -c "$1"
}

# Fonction pour mise à jour de progression
update_progress() {
    echo "$1"
    echo "# $2"
    sleep 1
}

### DNF ###
(
    update_progress 5 "Activation dépôt Cisco OpenH264"
    run_sudo_command "dnf config-manager setopt fedora-cisco-openh264.enabled=1"

    update_progress 10 "RPM Fusion Non-Free"
    run_sudo_command "dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-\$(rpm -E %fedora).noarch.rpm"

    update_progress 15 "RPM Fusion Free & Non-Free"
    run_sudo_command "dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-\$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-\$(rpm -E %fedora).noarch.rpm"

    update_progress 20 "Installation : steam"
    run_sudo_command "dnf install -y steam"

    update_progress 25 "Installation : discord"
    run_sudo_command "dnf install -y discord"

    update_progress 30 "Installation : firefox"
    run_sudo_command "dnf install -y firefox"

    update_progress 35 "Installation : htop"
    run_sudo_command "dnf install -y htop"

    update_progress 40 "Installation : btop"
    run_sudo_command "dnf install -y btop"

    update_progress 45 "Installation : vlc"
    run_sudo_command "dnf install -y vlc"

    update_progress 50 "Installation : bash-completion"
    run_sudo_command "dnf install -y bash-completion"

    update_progress 55 "Installation : openssh-server"
    run_sudo_command "dnf install -y openssh-server"

    update_progress 60 "Installation : fastfetch"
    run_sudo_command "dnf install -y fastfetch"

    update_progress 65 "Installation : virt-manager"
    run_sudo_command "dnf install -y virt-manager"

    update_progress 70 "Installation : docker"
    run_sudo_command "dnf install -y docker"

    update_progress 75 "Installation : obs-studio"
    run_sudo_command "dnf install -y obs-studio"

    update_progress 80 "Installation : gnome-disk-utility"
    run_sudo_command "dnf install -y gnome-disk-utility"

    update_progress 85 "Installation : VirtualBox"
    run_sudo_command "dnf install -y VirtualBox"

    update_progress 90 "Installation : gnome-boxes"
    run_sudo_command "dnf install -y gnome-boxes"

    update_progress 95 "Installation : audacity"
    run_sudo_command "dnf install -y audacity"

    update_progress 100 "Applications DNF installées."
) | zenity --progress \
    --title="Installation via DNF" \
    --text="Installation des applications via DNF..." \
    --percentage=0 \
    --auto-close \
    --width=400

### Flatpak ###
(
    update_progress 10 "Installation : VS Code"
    run_sudo_command "flatpak install -y flathub com.visualstudio.code"

    update_progress 20 "Installation : Vesktop"
    run_sudo_command "flatpak install -y flathub dev.vencord.Vesktop"

    update_progress 30 "Installation : Extension Manager"
    run_sudo_command "flatpak install -y flathub com.mattjakeman.ExtensionManager"

    update_progress 40 "Installation : Clicker"
    run_sudo_command "flatpak install -y flathub net.codelogistics.clicker"

    update_progress 50 "Installation : Prism Launcher"
    run_sudo_command "flatpak install -y flathub org.prismlauncher.PrismLauncher"

    update_progress 60 "Installation : Brave"
    run_sudo_command "flatpak install -y flathub com.brave.Browser"

    update_progress 70 "Installation : ShiftEy"
    run_sudo_command "flatpak install -y flathub io.github.shiftey.Desktop"

    update_progress 80 "Installation : LibreMenuEditor"
    run_sudo_command "flatpak install -y flathub page.codeberg.libre_menu_editor.LibreMenuEditor"

    update_progress 90 "Installation : MediaWriter"
    run_sudo_command "flatpak install -y flathub org.fedoraproject.MediaWriter"

    update_progress 100 "Installation : Video Downloader"
    run_sudo_command "flatpak install -y flathub com.github.unrud.VideoDownloader"
) | zenity --progress \
    --title="Installation via Flatpak" \
    --text="Installation des applications via Flatpak..." \
    --percentage=0 \
    --auto-close \
    --width=400

### .rpm ###
if [ -d rpm ]; then
    (
        update_progress 50 "Installation des .rpm dans ./rpm"
        cd rpm
        run_sudo_command "dnf install -y *.rpm"
        update_progress 100 "Fichiers .rpm installés."
    ) | zenity --progress \
        --title="Installation des fichiers .rpm" \
        --text="Installation des fichiers .rpm..." \
        --percentage=0 \
        --auto-close \
        --width=400
fi

# Fin et redémarrage
zenity --info \
    --text="Toutes les applications sont installées.\nRedémarrage dans 3 secondes..." \
    --timeout=3 \
    --width=400

sleep 3
reboot
