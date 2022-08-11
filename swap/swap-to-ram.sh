#!/usr/bin/env bash
cd $(dirname $0)

text=vm.swappiness=10
# edit conf
config_file="/etc/sysctl.conf" 
echo $text | sudo tee -a "$config_file"
