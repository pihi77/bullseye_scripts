#!/usr/bin/env bash
source ./config/config.sh
cd $(dirname $0)

echo "Swap to ram"
echo
config_file="/etc/sysctl.conf"
printf "Konfiguračný súbor: ${COLOR1} $config_file ${NC}"
echo

read -p 'Zadaj hodnotu: ' swap
pattern="vm.swappiness"
replace="vm.swappiness=$swap"
# edit conf
echo "$(grep -v "$pattern" $config_file)" | sudo tee $config_file
echo $replace | sudo tee -a $config_file


#text=vm.swappiness=10
# edit conf
#config_file="/etc/sysctl.conf" 
#echo $text | sudo tee -a "$config_file"
