#!/usr/bin/env bash

#header
source ./config/config.sh
cd $(dirname $0)

source ./dialog/yesno.sh "MariaDB" "Vytvorenie užívateľa" "\n Chceš vytvoriť užívateľa?" 8 60
if [[ $response == 0 ]]
then
    source ./dialog/user_input.sh "MariaDB" "Vytvorenie užívateľa" "\n $message \n Zadaj užívateľské meno:" 
    if [[ $RETVAL == "button_cancel_pressed" ]]
    then
        goto start
    elif [[ $RETVAL == "" ]]
    then
        RETVAL=user
    fi
    user=$RETVAL
    
    source ./dialog/user_input.sh "MariaDB" "Vytvorenie užívateľa" "\n $message \n Zadaj heslo:"
    if [[ $RETVAL == "button_cancel_pressed" ]]
    then
        goto start
    elif [[ $RETVAL == "" ]]
    then
        RETVAL=password
    fi
    password=$RETVAL
    
    source ./dialog/yesno.sh "MariaDB" "Vytvorenie užívateľa" "\n User: $user \n Password: $password \n\n Vytvoriť užívateľa ?" 10 60
    if [[ $response == 0 ]]
    then
        clear
        echo "Creating user $user"
        sudo mariadb -e "CREATE USER '$user'@localhost IDENTIFIED BY '$password';"
        echo "Grant all privileges for user $user"
        sudo mariadb -e "GRANT ALL PRIVILEGES ON *.* TO '$user'@localhost IDENTIFIED BY '$password';"
        read -p "Press any key to continue... " -n1 -s
    fi


else
    goto start 
fi



