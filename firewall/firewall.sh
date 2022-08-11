#!/usr/bin/env bash
cd $(dirname $0)

sudo apt install ufw gufw -y

pravidlo=http
read -p "Chceš povoliť $pravidlo ?" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    echo "Nastavujem $pravidlo"
    sudo ufw allow http
fi

pravidlo=https
read -p "Chceš povoliť $pravidlo ?" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    echo "Nastavujem $pravidlo"
    sudo ufw allow https
fi

pravidlo=GSConnect
read -p "Chceš povoliť $pravidlo ?" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    echo "Nastavujem $pravidlo"
    sudo ufw allow proto tcp to any port 1714:1764
    sudo ufw allow proto udp to any port 1714:1764
fi

echo "Zapínam firewall"
sudo ufw enable
sudo ufw status

