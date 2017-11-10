#!/bin/bash

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Language/Język:"
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

# Options
PS3='Please enter your choice: '
options=("English (en)" "Polski (pl)" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "English (en)")
while :
do
    clear
    cat<<EOF
    ==============================
    Script's menu
    ------------------------------
    Please enter your choice:

    Install required packages (1)
    Create Wine Prefix (2)
    Download osu!'s installer (3)
    Install necessary libraries and fonts (4)
    Install osu! (5)
           (Q)uit

    Author: Daria Szatan (bla-ke)
    License: MIT License
    ------------------------------

EOF
    read -n1 -s
    case "$REPLY" in
    "1")  echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Do you have uncommented multilib in your pacman configuration file?"
    echo "^^^^^^ [Y - Yes] [N - No]"
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    read confirmation

    if [[ $confirmation == "n" || $confirmation == "N" || $confirmation == "no" || $confirmation == "No" ]]; then
      sleep 2

      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^"
      echo "^^^^^^ You have to remove '#' before multilib repo lines"
      echo "^^^^^^ Example:"
      echo "^^^^^^ [multilib]"
      echo "^^^^^^ Include = /etc/pacman.d/mirrorlist"
      echo "^^^^^^ Executing nano command in 5 seconds..."
      echo "^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo ""

      sleep 5

      sudo nano /etc/pacman.conf

      sleep 1

    else
      sleep 2

      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^"
      echo "^^^^^^ Aborted editing /etc/pacman.conf!"
      echo "^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo ""

      sleep 1

    fi

    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Synchronizing packages..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 2

    sudo pacman -Sy

    sleep 1

    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Installing required packages..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 2

    sudo pacman -S wine winetricks wine_gecko wine-mono lib32-alsa-lib lib32-gnutls

    sleep 1

    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Done!"
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 1 ;;
    "2")  echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Initializing osu!'s Wine Prefix..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 2

    mkdir -p ~/'Wine Prefixes'
    WINEPREFIX=~/'Wine Prefixes/osu!' WINEARCH=win32 wineboot

    sleep 1

    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Done!"
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 1

    ;;
    "3")
    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Downloading osu!'s installer..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 2

    wget --no-check-certificate 'https://m1.ppy.sh/r/osu!install.exe' -O '/home/'$USER'/Wine Prefixes/osu!/drive_c/osu!install.exe'

    sleep 1

    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Done!"
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 1 ;;
    "4")  echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Sandboxing osu!'s Wine Prefix..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 2

    env WINEARCH=win32 WINEPREFIX=~/'Wine Prefixes/osu!' winetricks 'sandbox'

    sleep 1

    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Installing .NET Framework 4.0..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 2

    env WINEARCH=win32 WINEPREFIX=~/'Wine Prefixes/osu!' winetricks --unattended 'dotnet40'

    sleep 1

    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Installing necessary fonts..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 2

    env WINEARCH=win32 WINEPREFIX=~/'Wine Prefixes/osu!' winetricks 'cjkfonts'

    sleep 1

    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Done!"
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 1 ;;
    "5")  echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Install osu! in the default path, try to not interference to this proccess"
    echo "^^^^^^ After this everything the game will start automatically"
    echo "^^^^^^ Executing osu!'s installer in 10 seconds..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 10

    env WINEARCH=win32 WINEPREFIX=~/'Wine Prefixes/osu!' wine '/home/'$USER'/Wine Prefixes/osu!/drive_c/osu!install.exe'

    sleep 1

    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Cleaning everything..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 2

    rm '/home/'$USER'/Wine Prefixes/osu!/drive_c/osu!install.exe'

    sync

    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Done!"
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 1

    echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Exiting..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 1

    break  ;;
    "Q")  echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Exiting..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 1

    break  ;;
    "q")  echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Exiting..."
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    sleep 1

    break  ;;
     * )  echo "Invalid option"     ;;
    esac
    sleep 1
done ;;

"Polski (pl)")
while :
do
clear
cat<<EOF
==============================
Menu skryptu
------------------------------
Proszę wybrać jedną z poniższych opcji:

Zainstaluj wymagane pakiety (1)
Stwórz Wine Prefix (2)
Pobierz plik instalacyjny osu! (3)
Zainstaluj potrzebne biblioteki oraz czcionki (4)
Zainstaluj osu! (5)
   (W)yjdź

Autor: Daria Szatan (bla-ke)
Licencja: MIT License
------------------------------

EOF
read -n1 -s
case "$REPLY" in
"1")  echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Czy odkomentowałeś wcześniej repozytorium multilib w pacman.conf?"
echo "^^^^^^ [T - Tak] [N - Nie]"
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

read confirmation

if [[ $confirmation == "n" || $confirmation == "N" || $confirmation == "nie" || $confirmation == "Nie" ]]; then
  sleep 2

  echo ""
  echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  echo "^^^^^^"
  echo "^^^^^^ Musisz usunąć `#` przed linijkami repozytorium multilib"
  echo "^^^^^^ Przykład:"
  echo "^^^^^^ [multilib]"
  echo "^^^^^^ Include = /etc/pacman.d/mirrorlist"
  echo "^^^^^^ Uruchamianie nano w ciągu 5 sekund..."
  echo "^^^^^^"
  echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  echo ""

  sleep 5

  sudo nano /etc/pacman.conf

  sleep 1

else
  sleep 2

  echo ""
  echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  echo "^^^^^^"
  echo "^^^^^^ Uniknięto edycji /etc/pacman.conf!"
  echo "^^^^^^"
  echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  echo ""

  sleep 1

fi

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Synchronizowanie pakietów..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 2

sudo pacman -Sy

sleep 1

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Instalowanie wymaganych pakietów..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 2

sudo pacman -S sudo pacman -S wine winetricks wine_gecko wine-mono lib32-alsa-lib lib32-gnutls

sleep 1

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Zrobione!"
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 1 ;;
"2")  echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Inicjalizacja Wine Prefix'u osu!..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 2

mkdir -p ~/'Wine Prefixes'
WINEPREFIX=~/'Wine Prefixes/osu!' WINEARCH=win32 wineboot

sleep 1

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Zrobione!"
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 1 ;;
"3")  echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Pobieranie pliku instalacyjnego osu!..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 2

wget --no-check-certificate 'https://m1.ppy.sh/r/osu!install.exe' -O '/home/'$USER'/Wine Prefixes/osu!/drive_c/osu!install.exe'

sleep 1

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Zrobione!"
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 1 ;;
"4")  echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Umieszczanie Wine Prefix osu! w piaskownicy..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 2

env WINEARCH=win32 WINEPREFIX=~/'Wine Prefixes/osu!' winetricks 'sandbox'

sleep 1

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Instalowanie .NET Framework 4.0..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 2

env WINEARCH=win32 WINEPREFIX=~/'Wine Prefixes/osu!' winetricks --unattended 'dotnet40'

sleep 1

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Instalowanie niezbędnych czcionek..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 2

env WINEARCH=win32 WINEPREFIX=~/'Wine Prefixes/osu!' winetricks 'cjkfonts'

sleep 1

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Zrobione!"
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 1 ;;
"5")  echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Zainstaluj osu! w domyślnej ścieżce oraz nie integruj w ten proces"
echo "^^^^^^ Gra uruchomi się automatycznie po jej instalacji"
echo "^^^^^^ Uruchamianie pliku instalacyjnego osu w ciągu 10 sekund..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 10

env WINEARCH=win32 WINEPREFIX=~/'Wine Prefixes/osu!' wine '/home/'$USER'/Wine Prefixes/osu!/drive_c/osu!install.exe'

sleep 1

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Czyszczenie pozostałości..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 2

rm '/home/'$USER'/Wine Prefixes/osu!/drive_c/osu!install.exe'

sync

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Zrobione!"
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 1

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Kończenie..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 1

break  ;;
"W")  echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Kończenie..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 1

break  ;;
"w")  echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Kończenie..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 1

break  ;;
* )  echo "Nieprawidłowa opcja"  ;;

esac

sleep 1

done ;;

*) echo Invalid option ;;

"Quit")
echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Exiting..."
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

sleep 1

break

esac

done
