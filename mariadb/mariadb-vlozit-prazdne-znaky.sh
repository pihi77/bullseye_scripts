#!/usr/bin/env bash
cd $(dirname $0)

config_file="/etc/mysql/mariadb.conf.d/50-server.cnf" 
text="sql-mode=''"
echo $text | sudo tee -a "$config_file"
sudo systemctl restart mariadb