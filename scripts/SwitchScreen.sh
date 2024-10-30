#!/bin/bash
CONFIG_FILE="$HOME/.config/hypr/configs/Monitors.conf"

get_current_transform() {
    grep "monitor=.*transform," "$CONFIG_FILE" | sed -E 's/.*transform,([0-9]).*/\1/'
}

update_config() {
    local new_transform=$1
    sed -i "s/\(monitor=.*transform,\)[0-9]/\1$new_transform/" "$CONFIG_FILE"
}

current_transform=$(get_current_transform)

if [ "$current_transform" = "0" ]; then
    new_transform=2
else
    new_transform=0
fi

update_config $new_transform

hyprctl reload
