#!/bin/sh

if [ "$(nmcli -g common device show wlp5s0 | grep "100 (connected)")" ]; then
    echo -n "󰖩  "
    nmcli -e no -g all device show wlp5s0 | awk -F: '$2 ~ /\*/ {printf $13}'
    echo -n "%"
else
    echo -n "󰖪 "
fi
