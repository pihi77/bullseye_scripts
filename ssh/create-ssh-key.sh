#!/usr/bin/env bash

#header
source ./config/config.sh
echo "Generovanie SSH kľúča, pridanie do ssh-agenta"
echo
cd $(dirname $0)


source ./dialog/yesno.sh "SSH" "Konfigurácia SSH" "\n Chceš vytvoriť ssh kľúč ?" 8 60
if [[ $response == 0 ]]
then
    source ./dialog/user_input.sh "SSH" "Konfigurácia SSH"  "\n Zadaj email."
    if [[ $RETVAL == "button_cancel_pressed" ]]
    then
        goto start
    elif [[ $RETVAL == "" ]]
    then
        RETVAL=email      
    fi
    email=$RETVAL
    ssh-keygen -t ed25519 -C "$email"
    #ak nemas sifrovanie ed25519 odkomentuj nasledujuci riadok a zakomentuj predchadzajuci
    #ssh-keygen -t rsa -b 4096 -C "$email"
fi

source ./dialog/yesno.sh "SSH" "SSH-agent" "\n Pridať klúč do ssh-agenta ?" 8 60
if [[ $response == 0 ]]
then
    clear
    echo "Spúšťam ssh-agent"
    eval "$(ssh-agent -s)"
    read -p "Press any key to continue... " -n1 -s
    source ./dialog/user_input.sh "Konfigurácia SSH" "SSH" "\n Zadaj cestu kde je umiestnený kľúč."
    if [[ $RETVAL == "button_cancel_pressed" ]]
    then
        goto start
    elif [[ $RETVAL == "" ]]
    then
        RETVAL=~/.ssh/key      
    fi
    path_to_key=$RETVAL
    clear
    echo "Pridávam klúč $keypath"
    ssh-add $keypath
    
    echo "Zoznam kľúčov:"
    ssh-add -l

    echo "Obsah súuboru $keypath.pub:"
    echo
    cat "$keypath.pub"
    echo
    read -p "Press any key to continue... " -n1 -s
fi
clear
echo "Ninštalované ssh kľúce:"
ssh-add -l
read -p "Press any key to continue... " -n1 -s