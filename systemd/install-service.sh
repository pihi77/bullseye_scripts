#!/usr/bin/env bash
source ./config/config.sh
cd $(dirname $0)
default_dir=$(pwd)

# set files
service_dir="/etc/systemd/system"
printf "Adresár services: ${COLOR1} $config_file ${NC}"
name=$1

tmp_service="$name/$name.service"
shell_script="$default_dir/$name/$name.sh"

echo
echo "[Unit]" | tee $tmp_service
echo "Description=$name.sh" | tee -a $tmp_service
echo "After=default.target" | tee -a $tmp_service
echo "[Service]" | tee -a $tmp_service
echo "ExecStart=$shell_script" | tee -a $tmp_service
echo "[Install]" | tee -a $tmp_service
echo "WantedBy=default.target" | tee -a $tmp_service

sudo cp $tmp_service "$service_dir/$name.service"
rm $tmp_service
sudo systemctl enable "$name.service"

#systemctl list-unit-files --state=enabled







