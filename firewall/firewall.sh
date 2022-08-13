#!/usr/bin/env bash
source ./config/config.sh

# define rules
declare -a array 
# http
declare -a row1=( "http" "sudo ufw allow http" )
array[0]="$(stringify row1)"
# https
declare -a row2=( "https" "sudo ufw allow https" )
array[1]="$(stringify row2)"
# GSConnect
declare -a row3=( "GSConnect" "sudo ufw allow proto tcp to any port 1714:1764" "sudo ufw allow proto udp to any port 1714:1764" )
array[2]="$(stringify row3)"

for row in "${array[@]}"
do
    eval "$(unstringify thisRow "$row")"
  
    for i in "${!thisRow[@]}"; do 

        if [ $i == 0 ]
        then
            nazov=${thisRow[$i]}
        else
            #echo "Pravidlo: $nazov Prikaz: ${thisRow[$i]}"
            prikaz=${thisRow[$i]}
            source ./dialog/yesno.sh "Firewall ( ufw )" "$nazov" "\nChceš povoliť ?\n\n  $prikaz" 8 60
            if [[ $response == 0 ]]
            then
                clear
                echo "Nastavujem $nazov"
                echo "$($prikaz)"
                #read -p "Press any key to continue... " -n1 -s
            fi
        fi
    
    done

done
clear
sudo ufw status
read -p "Press any key to continue... " -n1 -s




