#!/bin/sh

if command -v pactl &>/dev/null; then
    if [ "$(pactl get-sink-mute @DEFAULT_SINK@ | 
            cut --delimiter=" " -f 2)" == "yes" ]; then
        echo 0
        exit
    else
        pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | 
        awk '{print substr($5, 1, length($5)-1)}'
    fi
fi
