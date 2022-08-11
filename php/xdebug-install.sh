#!/usr/bin/env bash
cd $(dirname $0)

# install xdebug
sudo apt install php-xdebug -y

# edit xdebug.ini
config_file="/etc/php/8.1/mods-available/xdebug.ini" 
xdebug_config_file="./xdebug_ini.conf"
cat "$xdebug_config_file" | sudo tee -a "$config_file"

# edit php.ini
config_file="/etc/php/8.1/apache2/php.ini" 
xdebug_config_file="./xdebug_php_ini.conf"
cat "$xdebug_config_file" | sudo tee -a "$config_file"

#restart apache
sudo systemctl restart apache2