#!/usr/bin/env bash
cd $(dirname $0)

read -p 'Nastav cas (s): ' grubvar

config_file="/etc/default/grub"
pattern="GRUB_TIMEOUT"
replace="GRUB_TIMEOUT=$grubvar"

echo "$(grep -v "$pattern" $config_file)" | sudo tee $config_file
echo $replace | sudo tee -a $config_file
#sudo sed -i "s/$search/$replace/" $config_file

# Update GRUB
sudo update-grub