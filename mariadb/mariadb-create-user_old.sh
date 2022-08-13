#!/usr/bin/env bash

#header
source ./config/config.sh
echo "Vytvorenie užívateľa a pridelenie práv"
echo
cd $(dirname $0)

read -p "Chceš vytvoriť užívateľa?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    read -p 'Username: ' user
    read -p 'Password: ' password
    #user="user"
    #password="password"
    echo "Creating user $user"
    sudo mariadb -e "CREATE USER '$user'@localhost IDENTIFIED BY '$password';"
    echo "Grant all privileges for user $user"
    sudo mariadb -e "GRANT ALL PRIVILEGES ON *.* TO '$user'@localhost IDENTIFIED BY '$password';"
fi

