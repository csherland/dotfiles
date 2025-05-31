#!/bin/bash

SPACE_ICONS=("~" ":messages:" ":terminal:" ":music:")

SPACE=(
  icon.font="sketchybar-app-font:Regular:16.0"
  background.color=$BG_SEC_COLR
  background.drawing=on
  label.width=7
)

sketchybar --add event aerospace_workspace_change

sid=0
for i in "${!SPACE_ICONS[@]}"; do
  sid=$(($i))
  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid "${SPACE[@]}" \
    script="$PLUGIN_DIR/space.sh $sid" \
    click_script="aerospace workspace $sid" \
    --set space.$sid icon=${SPACE_ICONS[i]}
done

sketchybar --add item space_separator_left left \
  --set space_separator_left icon= \
  icon.font="$FONT:Bold:16.0" \
  background.padding_left=10 \
  background.padding_right=10 \
  label.drawing=off \
  icon.color=$DARK_WHITE
