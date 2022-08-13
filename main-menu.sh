#!/bin/bash
# Bash Menu Script Example
cd $(dirname $0)
clear
echo "Debian Scripty"
echo
PS3='Zadaj výber: '

options=("Utilities" "Grub" "Firewall" "Swap" "Apache https" "PHP" "MariaDB" "SSH key" "System service" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Utilities")
            source ./utilities/utilities-install_old.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Grub")
            source ./grub/set-grub-timeout_old.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Firewall")
            source ./firewall/firewall_old.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Swap")
            source ./swap/swap-to-ram_old.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Apache https")
            source ./apache/apache-https-install_old.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "PHP")
            source ./php/php-install_old.sh
            source ./php/xdebug-install_old.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "MariaDB")
            source ./mariadb/mariadb-install_old.sh
            source ./mariadb/mariadb-vlozit-prazdne-znaky_old.sh
            source ./mariadb/mariadb-create-user_old.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "SSH key")
            source ./ssh/create-ssh-key_old.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "System service")
            source ./help/systemd-help.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Quit")
            break
            ;;
        *) echo "Nesprávna voľba $REPLY";;
    esac
done
