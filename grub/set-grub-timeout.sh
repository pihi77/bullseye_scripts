#!/usr/bin/env bash
source ./config/config.sh
cd $(dirname $0)

config_file="/etc/default/grub"
#printf ${COLOR1}
echo "Nastaví timeout Grubu pri štarte systému"
echo
printf "Konfiguračný súbor: ${COLOR1} $config_file ${NC}"
#printf "Konfiguračný súbor: $config_file"
echo
echo

read -p 'Nastav cas (s): ' grubvar

pattern="GRUB_TIMEOUT"
replace="GRUB_TIMEOUT=$grubvar"

echo "$(grep -v "$pattern" $config_file)" | sudo tee $config_file
echo $replace | sudo tee -a $config_file
#sudo sed -i "s/$search/$replace/" $config_file
#printf ${NC}
# Update GRUB
sudo update-grub