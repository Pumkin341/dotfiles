#!/bin/bash

# Get active_keymap for all keyboards
mapfile -t layouts < <(hyprctl devices -j | jq -r '.keyboards[].active_keymap')

# Find a non-US layout if available (for reliable detection when multiple keyboards)
current=""
for layout in "${layouts[@]}"; do
    if [[ "$layout" != *"English (US)"* ]]; then
        current="$layout"
        break
    fi
done

# Fallback to first layout if all are US (or only one keyboard)
if [[ -z "$current" ]] && [[ ${#layouts[@]} -gt 0 ]]; then
    current="${layouts[0]}"
fi

# Determine flag and name
case "$current" in
    *"English (US)"*)
        flag="🇺🇸"
        name="English (US)"
        ;;
    "Romanian"*)
        flag="🇷🇴"
        name="Română"
        ;;
    "Romanian (standard)"*)
        flag="🇷🇴"
        name="Română (standard)"
        ;;
    *)
        # Fallback: try to extract short code
        short=$(echo "$current" | grep -o '^[A-Za-z]*' | tr 'a-z' 'A-Z')
        flag="⌨"
        name="$short"
        ;;
esac

notify-send -t 800 -a "Keyboard" "$flag Layout" "$name"