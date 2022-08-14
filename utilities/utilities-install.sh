#!/usr/bin/env bash
#header
source ./config/config.sh

# system update
source ./system_update/system_update.sh
cd $(dirname $0)

# utils
source ./dialog/yesno.sh "Advanced Packaging Tool" "Inštalácia balíčkov" "\n Chceš inštalovať build-essential ?" 8 60
if [[ $response == 0 ]]
then
    dialog --prgbox   "build-essential" "sudo apt install build-essential dkms linux-headers-$(uname -r) -y"  20 80
    #sudo apt install build-essential dkms linux-headers-$(uname -r) -y
fi

# restricted-extras
source ./dialog/yesno.sh "Advanced Packaging Tool" "Inštalácia balíčkov" "\n Chceš inštalovať restricted-extras ?" 8 60
if [[ $response == 0 ]]
then
    dialog --prgbox   "restricted-extras" "sudo apt install ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi -y"  20 80
    #sudo apt install ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi -y
fi

# microsoft fonts
source ./dialog/yesno.sh "Advanced Packaging Tool" "Inštalácia balíčkov" "\n Chceš inštalovať kompatibilitu s fontami Microsoft ?" 8 60
if [[ $response == 0 ]]
then
    dialog --prgbox   "Microsoft fonts" "sudo apt install fonts-crosextra-carlito fonts-crosextra-caladea -y"  20 80
    #sudo apt install fonts-crosextra-carlito fonts-crosextra-caladea -y
fi
