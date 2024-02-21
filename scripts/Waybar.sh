#!/bin/bash

CONFIG="$HOME/.config/hypr/waybar/config"
STYLE="$HOME/.config/hypr/waybar/style.css"

if pidof waybar >/dev/null; then
    killall waybar
else
    /usr/bin/waybar --config ${CONFIG} --style ${STYLE} &
fi
