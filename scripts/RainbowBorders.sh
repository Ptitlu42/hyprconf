#!/bin/bash

colors=("0xffFE218B" "0xfffed700" "0xff21b0fe")

function random_color() {
    echo ${colors[$RANDOM % ${#colors[@]}]}
}

hyprctl keyword general:col.active_border $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) 270deg
hyprctl keyword general:col.inactive_border $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) $(random_color) 270deg