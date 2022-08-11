#!/usr/bin/env bash
read -p 'Username: ' user
read -p 'Username: ' password

#user="user"
#password="password"

echo "Creating user $user"
sudo mariadb -e "CREATE USER '$user'@localhost IDENTIFIED BY '$password';"
echo "Grant all privileges for user $user"
sudo mariadb -e "GRANT ALL PRIVILEGES ON *.* TO '$user'@localhost IDENTIFIED BY '$password';"