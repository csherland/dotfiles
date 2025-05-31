#!/bin/bash

SELECTED="false"
HIGHLIGHT_BG="0xFF313244"
ICON_COLOR="0xFFcdd6f4"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  SELECTED="true"
  HIGHLIGHT_BG="0xFFb4befe"
  ICON_COLOR="OxFFcdd6f4"
fi

sketchybar --animate tanh 5 --set $NAME \
  icon.highlight=$SELECTED \
  icon.color=$ICON_COLOR \
  background.color=$HIGHLIGHT_BG
