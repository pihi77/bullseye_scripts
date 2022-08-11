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
            echo "Bude sa inštalovať: build-essentials, restricted-extras, Microsoft font compatibility"
            source ./utilities/utilities-install.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Grub")
            echo "Nastaví timeout Grubu pri štarte systému"
            source ./grub/set-grub-timeout.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Firewall")
            echo "Firewall + GUI a základné pravidlá"
            source ./firewall/firewall.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Swap")
            echo "Swap to ram"
            source ./swap/swap-to-ram.sh
            ;;
        "Apache https")
            echo "Apache, SSL certifikát a presmerovanie http->https"
            source ./apache/apache-https-install.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "PHP")
            echo "PHP 8.1, Xdebug"
            source ./php/php-install.sh
            source ./php/xdebug-install.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "MariaDB")
            echo "MariaDB, povolenie vkladania prázdnych znakov do databázy, vytvorenie užívateľa a pridelenie práv"
            source ./mariadb/mariadb-install.sh
            source ./mariadb/mariadb-vlozit-prazdne-znaky.sh
            source ./mariadb/mariadb-create-user.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "SSH key")
            echo "Generovanie SSH kľúča, pridanie do ssh-agenta"
            source ./ssh/create-ssh-key.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "System service")
            echo "Pridanie, odstránenie systémového servisu pomocou systemd."
            echo "Do adresára /systemd vytvoríš podadresár s názvom služby a v ňom skript ktorý má rovnaky názov + koncovka .sh"
            echo
            echo "Syntax je nasledvoná zavoláš skript ( install alebo remove ) s argumentom ( nazov adresára ):"
            echo "install-service.sh default-audio"
            echo "remove-service.sh default-audio"
            echo
            cd systemd/
            echo "Príkazy:"
            yourfilenames=`ls *.sh`
            for eachfile in $yourfilenames
            do
                echo $eachfile
            done
            echo
            echo "Servisy:"
            for i in $(ls -d */); do echo ${i%%/}; done
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Quit")
            break
            ;;
        *) echo "Nesprávna voľba $REPLY";;
    esac
done
