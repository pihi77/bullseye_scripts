#!/usr/bin/env bash

#header
source ./config/config.sh
echo "Pridanie, odstránenie systémového servisu pomocou systemd."
echo
#cd $(dirname $0)

echo "Do adresára /systemd vytvoríš podadresár s názvom služby a v ňom skript ktorý má rovnaky názov + koncovka .sh"
echo
echo "Syntax je nasledvoná zavoláš skript ( napr. install alebo remove ) s argumentom ( nazov adresára ):"
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
exit 0