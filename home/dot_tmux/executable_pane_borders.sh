#!/usr/bin/env bash
# Called from the window-layout-changed hook with the affected window id.
#
# In a split window: show the per-pane label strip, and freeze the window name so it
# stops flipping between panes as you navigate (the pane labels carry that detail).
# Back to a single pane: hide the labels and let automatic renaming resume.

set -eu

window="${1:-}"
[ -n "$window" ] || exit 0

panes=$(tmux display -t "$window" -p '#{window_panes}' 2>/dev/null) || exit 0

if [ "$panes" -gt 1 ]; then
  tmux set-window-option -t "$window" pane-border-status top
  tmux set-window-option -t "$window" automatic-rename off
else
  tmux set-window-option -t "$window" pane-border-status off
  tmux set-window-option -t "$window" automatic-rename on
fi
