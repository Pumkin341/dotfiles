#!/bin/bash

VOLUME_FILE="$HOME/.config/waybar/.previous-volume"
SINK="@DEFAULT_SINK@"

# Check if currently muted
IS_MUTED=$(pactl get-sink-mute $SINK | grep -oP 'yes|no')

if [ "$IS_MUTED" = "yes" ]; then
    # Currently muted, unmute and restore previous volume
    if [ -f "$VOLUME_FILE" ]; then
        PREVIOUS_VOL=$(cat "$VOLUME_FILE")
        pactl set-sink-volume $SINK "${PREVIOUS_VOL}%"
    else
        # No previous volume saved, set to 50%
        pactl set-sink-volume $SINK "50%"
    fi
    pactl set-sink-mute $SINK 0
else
    # Not muted, save current volume and mute
    CURRENT_VOL=$(pactl get-sink-volume $SINK | grep -oP '\d+%' | head -1 | sed 's/%//')
    echo "$CURRENT_VOL" > "$VOLUME_FILE"
    pactl set-sink-mute $SINK 1
fi
