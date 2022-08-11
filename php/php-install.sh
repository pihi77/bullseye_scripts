#!/usr/bin/env bash
cd $(dirname $0)

# install php
sudo apt update
sudo apt upgrade
sudo apt -y install lsb-release apt-transport-https ca-certificates wget
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update
sudo apt install php8.1 -y
sudo apt install php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-redis php8.1-intl -y

# configuration php.ini
config_file="/etc/php/8.1/apache2/php.ini"

search="upload_max_filesize = 2M"
replace="upload_max_filesize = 1024M"
sudo sed -i "s/$search/$replace/" $config_file

search="post_max_size = 8M"
replace="post_max_size = 1024M"
sudo sed -i "s/$search/$replace/" $config_file

search="memory_limit = 128M"
replace="memory_limit = 256M"
sudo sed -i "s/$search/$replace/" $config_file

search="max_execution_time = 30"
replace="max_execution_time = 600"
sudo sed -i "s/$search/$replace/" $config_file

search=";max_input_vars = 1000"
replace="max_input_vars = 3000"
#sudo sed -i "s/$search/$replace/" $config_file

search="max_input_time = 60"
replace="max_input_time = 1000"
#sudo sed -i "s/$search/$replace/" $config_file

# restart apache
sudo systemctl restart apache2.service
sudo systemctl status  apache2.service

#show installed version and modules
php -v
php -m