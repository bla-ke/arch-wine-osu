# English (en)
## Description
Install osu! on Arch Linux! arch-wine-osu is an easy-to-use script that will give you a possibility to install this popular rythm music game.

## Giving permissions to run this script
```
chmod +x /path/to/script.sh
```

## Editing /etc/pacman.conf file
To install packages, you need to uncomment lines with multilib repository. You can easily do it manually:
```
sudo nano /etc/pacman.conf
```

Uncommenting means removing `#` symbol before lines. For example:

```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

## After installation
To run your game, just type in your terminal:
```
env WINEARCH=win32 WINEPREFIX=~/'Wine Prefixes/osu!' wine '/home/'$USER'/Wine Prefixes/osu!/drive_c/osu!.exe'
```

## Additional information
- Your password is needed to install required packages;
- This script should go properly with Manjaro, but check it before executing.


# Polski (pl)
## Opis
Zainstaluj osu! na systemie Arch Linux! Ten łatwy w użytkowaniu skrypt pozwoli Ci na bezproblemową instalację gry.

## Nadanie uprawnień do uruchamiania jako program
```
chmod +x /ścieżka/do/skryptu.sh
```

## Edycja pliku /etc/pacman.conf
Aby zainstalować wymagane pakiety, musisz odkomentować poszczególne wiersze w pliku /etc/pacman.conf. Możesz to zrobić własnoręcznie za pomocą komendy:
```
sudo nano /etc/pacman.conf
```

Odkomentowanie oznacza usunięcie znaku `#` przed wersami. Przykładowo:

```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

## Po instalacji
Aby uruchomić grę, po prostu wpisz w konsoli:
```
env WINEARCH=win32 WINEPREFIX=~/'Wine Prefixes/osu!' wine '/home/'$USER'/Wine Prefixes/osu!/drive_c/osu!.exe'
```

## Dodatkowe informacje
- Twoje hasło jest potrzebne do instalacji wymaganych pakietów;
- Ten skrypt powinien zadziałać bez żadnych problemów na Manjaro, jednak sprawdź go przed wykonaniem.
