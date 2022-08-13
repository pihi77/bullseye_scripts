#!/bin/bash
backtitle=$1
title=$2
description=$3
# inputbox - demonstrate the input dialog box with redirection


# Define the dialog exit status codes
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

# Duplicate (make a backup copy of) file descriptor 1 
# on descriptor 3
exec 3>&1
 
# Generate the dialog box while running dialog in a subshell
result=$(dialog \
  --backtitle "$backtitle" \
  --title "$title" \
  --clear  \
  --inputbox \
"$description" \
16 51 2>&1 1>&3)

# Get dialog's exit status
return_value=$?

# Close file descriptor 3
exec 3>&-

# Act on the exit status
case $return_value in
  $DIALOG_OK)
    #echo "Result: $result"
    RETVAL=$result
    ;;
  $DIALOG_CANCEL)
    echo "Cancel pressed."
    RETVAL="button_cancel_pressed"
    ;;
  $DIALOG_HELP)
    echo "Help pressed.";;
  $DIALOG_EXTRA)
    echo "Extra button pressed.";;
  $DIALOG_ITEM_HELP)
    echo "Item-help button pressed.";;
  $DIALOG_ESC)
    if test -n "$result" ; then
      #echo "$result"
      RETVAL=$result
    else
      echo "ESC pressed."
      exit 0
    fi
    ;;
esac
#return "$result"