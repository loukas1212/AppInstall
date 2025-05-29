#!/bin/bash

while true; do
    clear
    echo "==== AppInstall Beta v0.0.1 ===="
    echo "Option 1 : lancer le script d'installation d'application pour Ubuntu GNOME"
    echo "Option 2 : lancer le script d'installation d'application pour Fedora GNOME"
    echo "Option 3 : lancer le script d'installation de flatpak pour Ubuntu GNOME"
    echo "Option 4 : lancer le script d'installation de flatpak pour Kubuntu"
    echo "Option 5 : lancer le script d'installation de flatpak pour Fedora"
    echo "Option 6 : lancer le script d'installation de flatpak pour Debian"
    echo "Option 7 : lancer le script d'installation d'application pour Debian GNOME"
    echo "Option 8 : Quitter"
    echo "================================"
    read -p "Veuillez entrer un numéro (1-6) : " choix

    case $choix in
        1)
            bash script/ub-gnome.sh
            read -p "Appuyez sur Entrée pour revenir au menu..."
            ;;
        2)
            bash script/fd-gnome.sh
            read -p "Appuyez sur Entrée pour revenir au menu..."
            ;;
        3)
            bash script/flatpak-it/ub-gm-fp.sh
            read -p "Appuyez sur Entrée pour revenir au menu..."
            ;;
        4)
            bash script/flatpak-it/ub-kde-fp.sh
            read -p "Appuyez sur Entrée pour revenir au menu..."
            ;;
        5)
            bash script/flatpak-it/fd-fp.sh
            read -p "Appuyez sur Entrée pour revenir au menu..."
            ;;

        6)
            bash script/flatpak-it/deb-gm-fp.sh
            read -p "Appuyez sur Entrée pour revenir au menu..."
            ;;

        7)
            bash script/deb-gnome.sh
            read -p "Appuyez sur Entrée pour revenir au menu..."
            ;;

        8)
            echo "Fermeture du menu."
            clear
            exit 0
            ;;
        *)
            echo "Option invalide. Veuillez entrer un nombre entre 1 et 6."
            read -p "Appuyez sur Entrée pour continuer..."
            ;;
    esac
done


