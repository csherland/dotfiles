#!/bin/bash

WIDTH="dynamic"
SELECTED="false"
HIGHLIGHT_BG="0xFF313244"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  WIDTH="0"
  SELECTED="true"
  HIGHLIGHT_BG="0xFF9399b2"
fi

sketchybar --animate tanh 5 --set $NAME \
  icon.highlight=$SELECTED \
  background.color=$HIGHLIGHT_BG \
  label.width=$WIDTH
