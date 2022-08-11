#!/usr/bin/env bash
cd $(dirname $0)

read -p 'Nastav cas (s): ' grubvar

config_file="/etc/default/grub"

search="GRUB_TIMEOUT=5"
replace="GRUB_TIMEOUT=$grubvar"
sudo sed -i "s/$search/$replace/" $config_file

# Update GRUB
sudo update-grub