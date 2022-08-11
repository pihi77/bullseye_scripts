#!/usr/bin/env bash
cd $(dirname $0)
default_dir=$(pwd)

# set files
service_dir="/etc/systemd/system"
name=$1

sudo systemctl disable "$name.service"
sudo rm "$service_dir/$name.service"

#systemctl list-unit-files --state=enabled