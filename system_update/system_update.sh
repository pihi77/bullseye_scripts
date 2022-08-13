# update
#read -p "Chceš aktualizovať systém ?" -n 1 -r
#echo    # (optional) move to a new line
#if [[  $REPLY =~ ^[YyAa]$ ]]
#then
#    echo "Updatujem systém"
#    sudo apt update
#    sudo apt upgrade
#fi
# autoremove
#read -p "Chceš odstrániť nepotrebné balíčky ?" -n 1 -r
#echo    # (optional) move to a new line
#if [[  $REPLY =~ ^[YyAa]$ ]]
#then
#    echo "Mažem nepotrebné balíčky"
#    sudo apt autoremove
#fi

# update
source ./dialog/yesno.sh "System update" "Aktualizácia systému" "\n Chceš aktualizovať ?" 8 60
if [[ $response == 0 ]]
then
    clear
    echo "Updatujem systém"
    sudo apt update
    sudo apt upgrade
fi

# autoremove
source ./dialog/yesno.sh "System update" "Automatické čistenie systému" "\n Chceš odstrániť nepotrebné balíčky ?" 8 60
if [[ $response == 0 ]]
then
    clear
    echo "Mažem nepotrebné balíčky"
    sudo apt autoremove
fi