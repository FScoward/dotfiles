#!/bin/sh

# The wifi_change event supplies a $INFO variable in which the current SSID
# is passed to the script.

# ref: https://github.com/FelixKratz/SketchyBar/issues/407#issuecomment-1755765318
INFO="$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //")"

WIFI=${INFO:-"Not Connected"}

sketchybar --set $NAME label="${WIFI}"
