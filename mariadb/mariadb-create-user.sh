user="user"
password="password"
database="test"

sudo mariadb -e "CREATE USER '$user'@localhost IDENTIFIED BY '$password';"
sudo mariadb -e "GRANT ALL PRIVILEGES ON *.* TO '$user'@localhost IDENTIFIED BY '$password';"