# arch-wine-osu
## Description
Install osu! with Arch Linux! This easy-to-use script will give you a possibility to install this rythm music game!

## Editing /etc/pacman.conf file
To install packages, you need to uncomment lines with multilib repository. You can easily do it manually:
```
sudo nano /etc/pacman.conf
```

Uncommenting means remving `#` symbol before lines. For example:

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
