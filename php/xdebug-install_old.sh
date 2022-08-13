#!/usr/bin/env bash

#header
source ./config/config.sh
echo "XDebug"
echo
# system update
source ./system_update/system_update_old.sh
cd $(dirname $0)

# install xdebug
read -p "Chceš inštalovať XDebug?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Inštalujem XDebug"
    sudo apt install php-xdebug -y

    # edit xdebug.ini
    config_file="/etc/php/8.1/mods-available/xdebug.ini" 
    printf "Konfiguračný súbor: ${COLOR1} $config_file ${NC}"
    xdebug_config_file="./xdebug_ini.conf"
    cat "$xdebug_config_file" | sudo tee -a "$config_file"

    # edit php.ini
    config_file="/etc/php/8.1/apache2/php.ini" 
    printf "Konfiguračný súbor: ${COLOR1} $config_file ${NC}"
    xdebug_config_file="./xdebug_php_ini.conf"
    cat "$xdebug_config_file" | sudo tee -a "$config_file"
fi

#restart apache
sudo systemctl restart apache2
sudo systemctl status apache2