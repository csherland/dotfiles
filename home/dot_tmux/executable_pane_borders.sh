#!/usr/bin/env bash
# Called from the window-layout-changed hook with the affected window id.
#
# In a split window: show the per-pane label strip, and freeze the window name so it
# stops flipping between panes as you navigate (the pane labels carry that detail).
# Back to a single pane: hide the labels and let automatic renaming resume.
#
# Freezing works by turning automatic-rename off, which is also what tmux does when you
# name a window yourself (prefix+R -> rename-window). So the two are indistinguishable
# from the option alone, and blindly turning it back on destroys a name you typed. We
# therefore only freeze when automatic renaming was on, record the name we froze in
# @frozen_name, and only resume if the name still matches -- a rename at any point while
# split leaves it different, and that window stays manually named.

set -eu

window="${1:-}"
[ -n "$window" ] || exit 0

panes=$(tmux display -t "$window" -p '#{window_panes}' 2>/dev/null) || exit 0

if [ "$panes" -gt 1 ]; then
  tmux set-window-option -t "$window" pane-border-status top
  # #{automatic-rename} rather than show-window-option: the latter prints an empty string
  # for a window that has never had the option set, instead of the inherited global value.
  autorename=$(tmux display -t "$window" -p '#{automatic-rename}' 2>/dev/null || true)
  if [ "$autorename" = "1" ]; then
    name=$(tmux display -t "$window" -p '#{window_name}' 2>/dev/null || true)
    tmux set-window-option -t "$window" @frozen_name "$name"
    tmux set-window-option -t "$window" automatic-rename off
  fi
else
  tmux set-window-option -t "$window" pane-border-status off
  frozen=$(tmux show-window-option -t "$window" -v @frozen_name 2>/dev/null || true)
  name=$(tmux display -t "$window" -p '#{window_name}' 2>/dev/null || true)
  tmux set-window-option -qt "$window" -u @frozen_name 2>/dev/null || true
  if [ -n "$frozen" ] && [ "$frozen" = "$name" ]; then
    tmux set-window-option -t "$window" automatic-rename on
  fi
fi
