#!/usr/bin/env bash

#header
source ./config/config.sh
echo "Povolenie vkladania prázdnych znakov do databázy"
echo
cd $(dirname $0)

read -p "Chceš povoliť vkladanie prázdnych znakov do databázy?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Povoľujem"
    config_file="/etc/mysql/mariadb.conf.d/50-server.cnf" 
    text="sql-mode=''"
    echo $text | sudo tee -a "$config_file"
    sudo systemctl restart mariadb
    sudo systemctl status mariadb
fi

