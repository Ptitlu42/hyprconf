#!/bin/bash

CONFIG="$HOME/.config/hypr/swaylock/config"

screenshot=$(mktemp).png
blurred=$(mktemp).png

grim "$screenshot"

convert "$screenshot" -blur 0x2 "$blurred"

sleep 0.5s

swaylock --config "${CONFIG}" -i "$blurred" & disown

(sleep 15s && rm "$screenshot" "$blurred") & disown