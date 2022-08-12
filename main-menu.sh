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
            echo "Generovanie SSH kľúča, pridanie do ssh-agenta"
            source ./ssh/create-ssh-key.sh
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "System service")
            source ./config/config.sh
            echo "Pridanie, odstránenie systémového servisu pomocou systemd."
            echo "Do adresára /systemd vytvoríš podadresár s názvom služby a v ňom skript ktorý má rovnaky názov + koncovka .sh"
            echo
            echo "Syntax je nasledvoná zavoláš skript ( install alebo remove ) s argumentom ( nazov adresára ):"
            echo
            echo "install-service.sh default-audio"
            echo "remove-service.sh default-audio"
            echo
            cd systemd/
            echo "Príkazy:"
            printf "${COLOR1}"
            yourfilenames=`ls *.sh`
            for eachfile in $yourfilenames
            do
                echo $eachfile
            done
            printf "${NC}"
            echo
            echo "Servisy:"
            printf "${COLOR1}"
            for i in $(ls -d */); do echo ${i%%/}; done
            printf "${NC}"
            echo
            read -p "Press any key to continue... " -n1 -s
            clear
            ;;
        "Quit")
            break
            ;;
        *) echo "Nesprávna voľba $REPLY";;
    esac
done
