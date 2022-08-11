#!/usr/bin/env bash

# update
read -p "Chceš aktualizovať systém ?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Updatujem systém"
    sudo apt update
    sudo apt upgrade
fi


# autoremove
read -p "Chceš odstrániť nepotrebné balíčky ?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Mažem nepotrebné balíčky"
    sudo apt autoremove
fi

# utils
pravidlo=Utility
read -p "Chceš inštalovať $pravidlo ?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Inštalujem $pravidlo"
    sudo apt install build-essential dkms linux-headers-$(uname -r) -y
fi

# restricted-extras
pravidlo=Extras
read -p "Chceš inštalovať $pravidlo ?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Inštalujem $pravidlo"
    sudo apt install ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi -y
fi

# microsoft fonts
pravidlo=Fonts
read -p "Chceš inštalovať $pravidlo ?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Inštalujem $pravidlo"
    sudo apt install fonts-crosextra-carlito fonts-crosextra-caladea -y
fi

