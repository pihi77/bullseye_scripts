#header
source ./config/config.sh
cd $(dirname $0)
cd ./kernel/
kernel_version=$(uname -r)
source ../dialog/yesno.sh "Konfigurácia KERNEL" "Aktuálna verzia kernelu: $kernel_version" "\n Chceš buildovať Kernel ?" 8 60
if [[ $response == 0 ]]
then
    
    echo "Dostupné verzie kernelu:";
    url="https://cdn.kernel.org/pub/linux/kernel/v5.x"
    list_file="kernel_list.html"
    rm "dostupny_$list_file"
    wget -O - $url | grep "linux-" > $list_file
    content=$(<$list_file)

    while read line; do    
        line=${line%<*}
        line=${line#*>}
        substr=".sign"
        if [[ $line == *"$substr"* ]];
        then
            echo "String contains substring."
        else
            echo "String does not contain substring."

            substr=".xz"
            if [[ $line == *"$substr"* ]];
            then
                echo "String contains substring."
            else
                echo "String does not contain substring."
                echo $line >> "dostupny_$list_file"
            fi
        fi
    done < $list_file

    #read -p "Press any key to continue... " -n1 -s
    dialog --textbox "dostupny_$list_file" 70 80
    rm "$list_file"
    #echo $content
    #cd ../
    source ../dialog/user_input.sh "Konfigurácia KERNEL" "Vyber verziu pre build" "\nZadaj verziu ktorá sa bude buildovať."
    if [[ $RETVAL == "button_cancel_pressed" ]]
    then
        goto start
    elif [[ $RETVAL == "" ]]
    then
        RETVAL=0      
    fi
    clear
        kernel_version=$RETVAL
        if [ -f "./linux-$kernel_version.tar.gz" ] 
        then
            echo "Directory /linux-$kernel_version exists." 
        else
            echo "Error: Directory /linux-$kernel_version does not exists."
            echo "Sťahujem kernel $kernel_version"
            wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$kernel_version.tar.gz
            wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$kernel_version.tar.sign
            tar xvzf linux-$kernel_version.tar.gz
        fi
        cd linux-$kernel_version/
        sudo cp -v /boot/config-$(uname -r) .config
        sudo apt-get install build-essential linux-source bc kmod cpio flex libncurses5-dev libelf-dev libssl-dev dwarves -y
        sudo make menuconfig
        cd ../
        read -p "Press any key to continue... " -n1 -s
        
fi

source ../dialog/yesno.sh "Kernel" "Version linux-$kernel_version" "\n Chceš buildovať linux-$kernel_version ?" 8 60
if [[ $response == 0 ]]
then
    clear
    echo "Buildujem linux-$kernel_version"
    cd linux-$kernel_version/
    sudo make localmodconfig
    sudo make bzImage
    sudo make modules && sudo make modules_install
    sudo make install
    cd ../
    read -p "Press any key to continue... " -n1 -s
fi

source ../dialog/yesno.sh "Kernel" "Version linux-$kernel_version" "\n Chceš updatovať GRUB ?" 8 60
if [[ $response == 0 ]]
then
    clear
    sudo update-grub
    read -p "Press any key to continue... " -n1 -s
fi
cd ../    
    