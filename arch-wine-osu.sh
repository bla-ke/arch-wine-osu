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
    Arch Linux osu! Install Script's menu
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
    echo "^^^^^^ Do you want to instal required packages?"
    echo "^^^^^^ [Y - Yes] [N - No]"
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    read confirmation

    if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
      echo ""
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
        echo ""
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo "^^^^^^"
        echo "^^^^^^ You have to remove '#' before multilib repo lines"
        echo "^^^^^^ Example:"
        echo "^^^^^^ '[multilib]"
        echo "^^^^^^ Include = /etc/pacman.d/mirrorlist'"
        echo "^^^^^^ Executing nano command in 5 seconds..."
        echo "^^^^^^"
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo ""

        sleep 5

        sudo nano /etc/pacman.conf

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

      else
        echo ""
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo "^^^^^^"
        echo "^^^^^^ Aborted!"
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

      sudo pacman -Sy

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

      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^"
      echo "^^^^^^ Installing required packages..."
      echo "^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo ""

      sudo pacman -S --needed wine winetricks wine_gecko wine-mono lib32-alsa-lib lib32-gnutls

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

      else
      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^"
      echo "^^^^^^ Aborted!"
      echo "^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo ""

      sleep 1

    fi
    ;;
    "2")  echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Do you want to create osu!'s Wine Prefix?"
    echo "^^^^^^ [Y - Yes] [N - No]"
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    read confirmation

    if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^"
      echo "^^^^^^ Initializing osu!'s Wine Prefix..."
      echo "^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo ""

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

    else
      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^"
      echo "^^^^^^ Aborted!"
      echo "^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo ""

      sleep 1

    fi
    ;;
    "3") echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Do you want to download osu!'s installer'?"
    echo "^^^^^^ [Y - Yes] [N - No]"
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    read confirmation

    if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^"
      echo "^^^^^^ Downloading osu!'s installer..."
      echo "^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo ""

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

      sleep 1

    else
      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^"
      echo "^^^^^^ Aborted!"
      echo "^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo ""

      sleep 1

    fi
    ;;
    "4") echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Do you want to install necessary libraries and fonts?"
    echo "^^^^^^ [Y - Yes] [N - No]"
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    read confirmation

    if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^"
      echo "^^^^^^ Sandboxing osu!'s Wine Prefix..."
      echo "^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo ""

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

      sleep 1

    else
      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^"
      echo "^^^^^^ Aborted!"
      echo "^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo ""

      sleep 1

    fi
    ;;
    "5") echo ""
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^"
    echo "^^^^^^ Do you want to install osu! game?"
    echo "^^^^^^ [Y - Yes] [N - No]"
    echo "^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    echo ""

    read confirmation

    if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
      echo ""
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

      rm '/home/'$USER'/Wine Prefixes/osu!/drive_c/osu!install.exe'

      sync

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

    else
      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^"
      echo "^^^^^^ Aborted!"
      echo "^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo ""

      sleep 1

    fi
    ;;
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

    break

    ;;

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

done
break

;;

        "Polski (pl)")
echo ""

;;
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
