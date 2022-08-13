#!/usr/bin/env bash

#header
source ./config/config.sh
echo "Nastaví timeout Grubu pri štarte systému"
echo
cd $(dirname $0)

# set grub config10
config_file="/etc/default/grub"
printf "Konfiguračný súbor: ${COLOR1} $config_file ${NC}"
echo
echo
read -p "Chceš nastaviť timeout?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    read -p 'Nastav cas (s): ' grubvar
    pattern="GRUB_TIMEOUT"
    replace="GRUB_TIMEOUT=$grubvar"

    echo "$(grep -v "$pattern" $config_file)" | sudo tee $config_file
    echo $replace | sudo tee -a $config_file

    # Update GRUB
    sudo update-grub
fi


