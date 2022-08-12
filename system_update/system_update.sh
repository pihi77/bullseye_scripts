# update
read -p "Chceš aktualizovať systém ?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Updatujem systém"
    sudo apt update
    sudo apt upgrade
fi
# autoremove
read -p "Chceš odstrániť nepotrebné balíčky ?" -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[YyAa]$ ]]
then
    echo "Mažem nepotrebné balíčky"
    sudo apt autoremove
fi