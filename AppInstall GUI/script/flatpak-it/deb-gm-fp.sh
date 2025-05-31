clear
echo "[5----]"
sleep 1
clear
echo "[-4---]"
sleep 1
clear
echo "[--3--]"
sleep 1
clear
echo "[---2-]"
sleep 1
clear
echo "[----1]"
sleep 1
clear

sudo apt update -y

sudo apt install flatpak -y

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo


clear
echo "reboot dans 10 seconde !"
sleep 5
clear
echo "[5----]"
sleep 1
clear
echo "[-4---]"
sleep 1
clear
echo "[--3--]"
sleep 1
clear
echo "[---2-]"
sleep 1
clear
echo "[----1]"
sleep 1
clear
reboot
