#!/usr/bin/env bash
#header
source ./config/config.sh
echo "Bude sa inštalovať: build-essentials, restricted-extras, Microsoft font compatibility"
echo
# system update
source ./system_update/system_update.sh
cd $(dirname $0)

# utils
source ./dialog/yesno.sh "$HEADER" "Inštalácia balíčkov" "\n Chceš inštalovať build-essential ?"
if [[ $response == 0 ]]
then
    clear
    sudo apt install build-essential dkms linux-headers-$(uname -r) -y
    read -p "Press any key to continue... " -n1 -s
fi
#pravidlo="build-essential"
#read -p "Chceš inštalovať $pravidlo ?" -n 1 -r
#echo    # (optional) move to a new line
#if [[  $REPLY =~ ^[YyAa]$ ]]
#then
#    echo "Inštalujem $pravidlo"
#    sudo apt install build-essential dkms linux-headers-$(uname -r) -y
#fi

# restricted-extras
source ./dialog/yesno.sh "$HEADER" "Inštalácia balíčkov" "\n Chceš inštalovať restricted-extras ?"
if [[ $response == 0 ]]
then
    clear
    sudo apt install ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi -y
    read -p "Press any key to continue... " -n1 -s
fi
#pravidlo=Extras
#read -p "Chceš inštalovať $pravidlo ?" -n 1 -r
#echo    # (optional) move to a new line
#if [[  $REPLY =~ ^[YyAa]$ ]]
#then
#    echo "Inštalujem $pravidlo"
#   sudo apt install ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi -y
#fi

# microsoft fonts
source ./dialog/yesno.sh "$HEADER" "Inštalácia balíčkov" "\n Chceš inštalovať kompatibilitu s fontami Microsoft ?"
if [[ $response == 0 ]]
then
    clear
    sudo apt install fonts-crosextra-carlito fonts-crosextra-caladea -y
    read -p "Press any key to continue... " -n1 -s
fi
#pravidlo=Fonts
#read -p "Chceš inštalovať $pravidlo ?" -n 1 -r
#echo    # (optional) move to a new line
#if [[  $REPLY =~ ^[YyAa]$ ]]
#then
#    echo "Inštalujem $pravidlo"
#    sudo apt install fonts-crosextra-carlito fonts-crosextra-caladea -y
#fi

