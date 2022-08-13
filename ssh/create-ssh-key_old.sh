#!/usr/bin/env bash

#header
source ./config/config.sh
echo "Generovanie SSH kľúča, pridanie do ssh-agenta"
echo
cd $(dirname $0)

read -p "Chceš vytvoriť ssh kľúč?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    read -p 'Zadaj email: ' email
    echo $email
    ssh-keygen -t ed25519 -C "$email"
    #ak nemas sifrovanie ed25519 odkomentuj nasledujuci riadok a zakomentuj predchadzajuci
    #ssh-keygen -t rsa -b 4096 -C "$email"
fi

read -p "Pridať klúč do ssh-agenta ?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[YyAa]$ ]]
then
    echo "Spúšťam ssh-agent"
    eval "$(ssh-agent -s)"
    read -p 'Zadaj cestu kde je umiestnený kľúč: ' keypath
    echo "Pridávam klúč $keypath"
    ssh-add $keypath
    
    echo "Zoznam kľúčov:"
    ssh-add -l

    echo "Obsah súuboru $keypath.pub:"
    echo
    cat "$keypath.pub"
    echo
fi

echo "Ninštalované ssh kľúce:"
ssh-add -l