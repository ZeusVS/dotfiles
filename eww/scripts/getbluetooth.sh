#!/bin/sh

IFS="\n"
if [ "$(bluetoothctl show | grep Powered |
        cut --delimiter=" " -f 2)" == "yes" ]; then
    echo -n "󰂯"
    n=0
    for i in $(bluetoothctl devices Connected | grep Device);
    do  
        n=$((n+1))
    done
    echo -n " Connected: ${n}"
else
    echo -n "󰂲"
fi
