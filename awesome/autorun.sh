#!/usr/bin/env bash

function run {
    if ! pgrep $1 ; then
        $@&
    fi
}

if xrandr | grep -q 'DisplayPort-0 connected' ; then
    xrandr --output DisplayPort-0 --mode 2560x1080 --rate 75
fi
