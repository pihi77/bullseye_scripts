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
            source ./utilities/utilities-install.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Grub")
            source ./grub/set-grub-timeout.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Firewall")
            source ./firewall/firewall.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Swap")
            source ./swap/swap-to-ram.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Apache https")
            source ./apache/apache-https-install.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "PHP")
            source ./php/php-install.sh
            source ./php/xdebug-install.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "MariaDB")
            source ./mariadb/mariadb-install.sh
            source ./mariadb/mariadb-vlozit-prazdne-znaky.sh
            source ./mariadb/mariadb-create-user.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "SSH key")
            source ./ssh/create-ssh-key.sh
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
