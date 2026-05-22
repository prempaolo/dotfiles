#!/bin/bash

WALLDIR="$HOME/Pictures/wallpapers/wallpapers"

while true; do
    IMG=$(find "$WALLDIR" -type f | shuf -n 1)

    wal -i "$IMG" --backend feh

    sleep 300
done
