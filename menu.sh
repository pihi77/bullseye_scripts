#!/bin/bash
source ./config/config.sh

# is dialog installed?
REQUIRED_PKG="dialog"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt install $REQUIRED_PKG -y
  #sudo apt-get --yes install $REQUIRED_PKG 
fi

goto() {
  label=$1
  cmd=$(sed -En "/^[[:space:]]*#[[:space:]]*$label:[[:space:]]*#/{:a;n;p;ba};" "$0")
  eval "$cmd"
  exit
}

start=${1:-start}
goto "$start" 
#start:#

HEIGHT=16
WIDTH=90
CHOICE_HEIGHT=4
#BACKTITLE="     PIHI s.r.o. - Marek Mihók"
TITLE="Debian - scripts"
MENU="Vyber jednu z nasledujúcich možností:"
#MENU=""
OPTIONS=(1 "Utilities - build-essentials, restricted-extras, Microsoft font compatibility"
         2 "Grub set timeout"
         3 "Firewall, Basic rules ( http, https, ... )"
         4 "Swap to RAM"
         5 "Apache, SSL certificate ( self signed ), HTTPS redirect"
         6 "PHP 8.1, XDebug"
         7 "MariaDB, Empty chars, Create user"
         8 "SSH key, ssh-agent"
         9 "System service ( systemd )"
         )

CHOICE=$(dialog --clear \
                --backtitle "$HEADER" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            goto utilities
            ;;
        2)
            goto grub
            ;;
        3)
            goto firewall
            ;;
        4)
            goto swap
            ;;
        5)
            goto apache
            ;;
        6)
            goto php
            ;;
        7)
            goto mariadb
            ;;
        8)
            goto ssh
            ;;
        9)
            goto service
            ;;
esac
exit 0

#utilities:#
source ./utilities/utilities-install.sh
goto start

#grub:#
source ./grub/set-grub-timeout.sh
goto start

#firewall:#
source ./firewall/firewall.sh
goto start

#swap:#
source ./swap/swap-to-ram.sh
goto start

#apache:#
source ./apache/apache-https-install.sh 
goto start

#php:#
source ./php/php-install.sh
source ./php/xdebug-install.sh
goto start

#mariadb:#
source ./mariadb/mariadb-install.sh
source ./mariadb/mariadb-vlozit-prazdne-znaky.sh
source ./mariadb/mariadb-create-user.sh    
goto start

#ssh:#
source ./ssh/create-ssh-key.sh
goto start

#service:#
source ./help/systemd-help.sh
read -p "Press any key to continue... " -n1 -s
goto start