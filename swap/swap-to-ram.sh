#!/usr/bin/env bash
#header
source ./config/config.sh
cd $(dirname $0)

# set config
config_file="/etc/sysctl.conf"

source ./dialog/yesno.sh "Konfigurácia swap" "Konfiguračný súbor: $config_file" "\n Chceš nastaviť swap" 8 60
if [[ $response == 0 ]]
then
    #yes 
    source ./dialog/user_input.sh "Konfigurácia swap" "Konfiguračný súbor: $config_file" "\n Zadaj hodnotu"
    if [[ $RETVAL == "button_cancel_pressed" ]]
    then
        goto start
    elif [[ $RETVAL == "" ]]
    then
        RETVAL=0      
    fi
    clear
    pattern="vm.swappiness"
    replace="vm.swappiness=$RETVAL"
    # edit conf
    echo "$(grep -v "$pattern" $config_file)" | sudo tee $config_file
    echo $replace | sudo tee -a $config_file
    dialog --textbox $config_file 40 80
    #read -p "Press any key to continue... " -n1 -s
else 
    #no
    goto start    
fi