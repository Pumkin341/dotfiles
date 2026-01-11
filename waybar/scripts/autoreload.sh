#!/bin/bash

CONFIG="$HOME/.config/waybar/config.jsonc"
STYLE="$HOME/.config/waybar/style.css"

waybar & 

inotifywait -m -e modify "$CONFIG" "$STYLE" | while read -r event; do
    killall -SIGUSR2 waybar
done