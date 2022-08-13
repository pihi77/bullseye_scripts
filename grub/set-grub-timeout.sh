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

source ./dialog/yesno.sh "Konfigurácia GRUB" "Konfiguračný súbor: $config_file" "\n Chceš nastaviť timeout?" 8 60
if [[ $response == 0 ]]
then
    
    source ./dialog/user_input.sh "Konfigurácia GRUB" "Konfiguračný súbor: $config_file" "\n Zadaj timeout v sekundách."
    if [[ $RETVAL == "button_cancel_pressed" ]]
    then
        goto start
    elif [[ $RETVAL == "" ]]
    then
        RETVAL=0      
    fi
    clear
        pattern="GRUB_TIMEOUT"
        replace="GRUB_TIMEOUT=$RETVAL"

        echo "$(grep -v "$pattern" $config_file)" | sudo tee $config_file
        echo $replace | sudo tee -a $config_file

        # Update GRUB
        sudo update-grub
        read -p "Press any key to continue... " -n1 -s
fi




