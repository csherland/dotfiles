#!/usr/bin/env bash
# Called from the session-created hook with the new session id.
# Names unnamed (numeric) sessions after the directory they were started in,
# adding a numeric suffix if that name is already taken.

set -eu

session="$1"
name=$(tmux display -t "$session" -p '#S')
case "$name" in *[!0-9]*) exit 0 ;; esac

dir=$(tmux display -t "$session" -p '#{b:pane_current_path}')
dir="${dir#.}"
[ -n "$dir" ] || exit 0

candidate="$dir"
n=2
while tmux has-session -t "=$candidate" 2>/dev/null; do
  candidate="$dir-$n"
  n=$((n + 1))
done
tmux rename-session -t "$session" "$candidate"
