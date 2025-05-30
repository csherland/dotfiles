#!/usr/bin/env sh

LABEL="$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs ipconfig getsummary | awk -F ' SSID : ' '/ SSID : / {print $2}')"

if [[ "$LABEL" == *"You are not associated with an AirPort network."* ]]; then
  sketchybar --set wifi label="Disconnected"
else
  LABEL=$(echo "$LABEL" | sed "s/Current Wi-Fi Network: //")
  sketchybar --set wifi label="$LABEL"
fi
