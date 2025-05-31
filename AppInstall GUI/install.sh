#!/bin/bash

while true; do
    choix=$(zenity --list --title="AppInstall GUI" \
        --width=600 --height=400 \
        --column="Option" --column="Description" \
        1 "lancer le script d'installation d'application pour Ubuntu GNOME" \
        2 "lancer le script d'installation d'application pour Fedora GNOME" \
        3 "lancer le script d'installation de flatpak pour Ubuntu GNOME" \
        4 "lancer le script d'installation de flatpak pour Kubuntu" \
        5 "lancer le script d'installation de flatpak pour Fedora" \
        6 "lancer le script d'installation de flatpak pour Debian GNOME" \
        7 "lancer le script d'installation d'application pour Debian GNOME" \
        8 "Quitter")

    # Vérifie si zenity a été annulé ou fermé
    if [[ $? -ne 0 || -z "$choix" ]]; then
        zenity --question --text="Voulez-vous vraiment quitter le menu ?" --width=300
        if [[ $? -eq 0 ]]; then
            exit 0
        else
            continue
        fi
    fi

    case $choix in
        1) bash script/ub-gnome.sh ;;
        2) bash script/fd-gnome.sh ;;
        3) bash script/flatpak-it/ub-gm-fp.sh ;;
        4) bash script/flatpak-it/ub-kde-fp.sh ;;
        5) bash script/flatpak-it/fd-fp.sh ;;
        6) bash script/flatpak-it/deb-gm-fp.sh ;;
        7) bash script/deb-gnome.sh ;;
        8) exit 0 ;;
        *) zenity --error --text="Option invalide." ;;
    esac
done
