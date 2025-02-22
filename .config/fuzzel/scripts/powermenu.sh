#!/bin/bash

entries="⇠ Logout\n⏾ Suspend\n⭮ Reboot\n⏻ Shutdown\n Lock"

selected=$(echo -e $entries|fuzzel --config=/home/jim/.config/fuzzel/config --lines=4 -d -p ?| awk '{print tolower($2)}')

case $selected in
  logout)
    swaymsg exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
  lock)
    exec pkill -SIGUSR1 swayidle;;
esac
