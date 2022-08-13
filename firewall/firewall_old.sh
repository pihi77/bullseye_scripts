#!/usr/bin/env bash

#header
source ./config/config.sh

echo "Firewall + GUI a základné pravidlá"
echo
# system update
source ./system_update/system_update_old.sh
cd $(dirname $0)

clear
# firewal install   
read -p "Chceš inštalovať firewall?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Inštalujem firewall"
    sudo apt install ufw gufw -y
fi

# enable rules
pravidlo=http
read -p "Chceš povoliť $pravidlo ?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Nastavujem $pravidlo"
    sudo ufw allow http
fi

pravidlo=https
read -p "Chceš povoliť $pravidlo ?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Nastavujem $pravidlo"
    sudo ufw allow https
fi

pravidlo=GSConneect
read -p "Chceš povoliť $pravidlo ?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Nastavujem $pravidlo"
    sudo ufw allow proto tcp to any port 1714:1764
    sudo ufw allow proto udp to any port 1714:1764
fi

# firewal status
echo "Zapínam firewall"
sudo ufw enable
sudo ufw status

