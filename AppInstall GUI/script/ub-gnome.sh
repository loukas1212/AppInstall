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

### APT ###
(
    update_progress 5 "Mise à jour des dépôts"
    run_sudo_command "apt update"

    update_progress 10 "Installation : firefox"
    run_sudo_command "apt install -y firefox"

    update_progress 15 "Installation : htop"
    run_sudo_command "apt install -y htop"

    update_progress 20 "Installation : btop"
    run_sudo_command "apt install -y btop"

    update_progress 25 "Installation : vlc"
    run_sudo_command "apt install -y vlc"

    update_progress 30 "Installation : bash-completion"
    run_sudo_command "apt install -y bash-completion"

    update_progress 35 "Installation : openssh-server"
    run_sudo_command "apt install -y openssh-server"

    update_progress 40 "Installation : fastfetch"
    run_sudo_command "apt install -y fastfetch"

    update_progress 45 "Installation : virt-manager"
    run_sudo_command "apt install -y virt-manager"

    update_progress 50 "Installation : docker.io"
    run_sudo_command "apt install -y docker.io"

    update_progress 55 "Installation : obs-studio"
    run_sudo_command "apt install -y obs-studio"

    update_progress 60 "Installation : gnome-disk-utility"
    run_sudo_command "apt install -y gnome-disk-utility"

    update_progress 65 "Installation : virtualbox"
    run_sudo_command "apt install -y virtualbox"

    update_progress 70 "Installation : steam"
    run_sudo_command "apt install -y steam"

    update_progress 75 "Installation : gnome-boxes"
    run_sudo_command "apt install -y gnome-boxes"

    update_progress 80 "Installation : audacity"
    run_sudo_command "apt install -y audacity"

    update_progress 100 "Applications APT installées."
) | zenity --progress \
    --title="Installation via APT" \
    --text="Installation des applications via APT..." \
    --percentage=0 \
    --auto-close \
    --width=400

### Flatpak ###
(
    update_progress 10 "Installation : Visual Studio Code"
    run_sudo_command "flatpak install -y flathub com.visualstudio.code"

    update_progress 20 "Installation : Vencord (Vesktop)"
    run_sudo_command "flatpak install -y flathub dev.vencord.Vesktop"

    update_progress 30 "Installation : Gnome Extension Manager"
    run_sudo_command "flatpak install -y flathub com.mattjakeman.ExtensionManager"

    update_progress 40 "Installation : Clicker"
    run_sudo_command "flatpak install -y flathub net.codelogistics.clicker"

    update_progress 50 "Installation : Prism Launcher"
    run_sudo_command "flatpak install -y flathub org.prismlauncher.PrismLauncher"

    update_progress 60 "Installation : Brave"
    run_sudo_command "flatpak install -y flathub com.brave.Browser"

    update_progress 70 "Installation : GitHub Desktop"
    run_sudo_command "flatpak install -y flathub io.github.shiftey.Desktop"

    update_progress 80 "Installation : LibreMenuEditor"
    run_sudo_command "flatpak install -y flathub page.codeberg.libre_menu_editor.LibreMenuEditor"

    update_progress 90 "Installation : Fedora Media Writer"
    run_sudo_command "flatpak install -y flathub org.fedoraproject.MediaWriter"

    update_progress 95 "Installation : Video Downloader"
    run_sudo_command "flatpak install -y flathub com.github.unrud.VideoDownloader"

    update_progress 100 "Applications Flatpak installées."
) | zenity --progress \
    --title="Installation via Flatpak" \
    --text="Installation des applications via Flatpak..." \
    --percentage=0 \
    --auto-close \
    --width=400

### Installation .deb ###
if [ -d deb ]; then
    (
        update_progress 50 "Installation des .deb dans ./deb"
        cd deb
        run_sudo_command "apt install -y ./*.deb"
        update_progress 100 "Fichiers .deb installés."
    ) | zenity --progress \
        --title="Installation des fichiers .deb" \
        --text="Installation des fichiers .deb..." \
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
