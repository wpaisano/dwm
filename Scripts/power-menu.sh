#!/bin/bash

shutdown=" Shutdown"
reboot=" Reboot"
logout=" Logout"

# Variable passed to dmenu
options="$shutdown\n$reboot\n$logout"

chosen="$(echo -e "$options" | dmenu -i -p "Power-Menu " )"
case $chosen in
    $shutdown)
        /sbin/shutdown -h now
        ;;
    $reboot)
        sudo shutdown -r now
        ;;
    $logout)
        pkill -KILL -u $USER
        ;;
esac