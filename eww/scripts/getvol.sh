#!/bin/sh

if command -v pactl &>/dev/null; then
    if [ "$(pactl get-sink-mute @DEFAULT_SINK@ | 
            cut --delimiter=" " -f 2)" == "yes" ]; then
        echo -n "󰝟 "
    else
        echo -n "󰕾 "
    fi
    pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | 
        awk '{printf substr($5, 1, length($5)-1)}'
    echo "%"
fi
