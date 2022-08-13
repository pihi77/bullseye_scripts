#!/usr/bin/env bash
source ./config/config.sh
cd $(dirname $0)

echo "Swap to ram"
echo
config_file="/etc/sysctl.conf"
printf "Konfiguračný súbor: ${COLOR1} $config_file ${NC}"
echo
echo
read -p "Chceš nastaviť swap ?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    read -p 'Zadaj hodnotu: ' swap
    pattern="vm.swappiness"
    replace="vm.swappiness=$swap"
    # edit conf
    echo "$(grep -v "$pattern" $config_file)" | sudo tee $config_file
    echo $replace | sudo tee -a $config_file
fi