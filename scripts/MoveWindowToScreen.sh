#!/bin/bash

MAIN_MONITOR_ID="0"
HDMI_MONITOR_ID="1"
MAIN_MONITOR_NAME="eDP-1"
HDMI_MONITOR_NAME="HDMI-A-1"

current_monitor_id=$(hyprctl activewindow -j | jq -r '.monitor')

if [ "$current_monitor_id" = "$MAIN_MONITOR_ID" ]; then
    target_monitor="$HDMI_MONITOR_NAME"
else
    target_monitor="$MAIN_MONITOR_NAME"
fi

hyprctl dispatch movewindow mon:$target_monitor 