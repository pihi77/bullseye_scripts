#!/bin/bash
backtitle=$1
title=$2
description=$3
height=$4
width=$5


dialog \
    --title "$title" \
    --backtitle "$backtitle" \
    --yesno "$description" $height $width  \

# Get exit status
# 0 means user hit [yes] button.
# 1 means user hit [no] button.
# 255 means user hit [Esc] key.
response=$?
case $response in
   0) echo "Yes";;
   1) echo "No";;
   255) exit 0;;
esac
return $response