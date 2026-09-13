#!/usr/bin/env bash
# Counts windows across all sessions whose agent has flagged for attention, for the
# right-hand side of the status bar. Prints nothing when nothing is pending, so the
# bar stays empty in the normal case. Run by tmux every status-interval seconds.
#
#   agent_summary.sh <waiting-colour> <done-colour>

set -eu

waiting_fg="${1:-yellow}"
done_fg="${2:-green}"

states=$(tmux list-windows -a -F '#{@agent_attention}' 2>/dev/null) || exit 0

waiting=$(printf '%s\n' "$states" | grep -c '^needs-input$' || true)
finished=$(printf '%s\n' "$states" | grep -c '^done$' || true)

out=""
[ "$waiting" -gt 0 ] && out="#[fg=${waiting_fg}]● ${waiting} waiting"
if [ "$finished" -gt 0 ]; then
  [ -n "$out" ] && out="$out#[fg=default]  "
  out="$out#[fg=${done_fg}]● ${finished} done"
fi
[ -n "$out" ] && printf '%s#[default]  ' "$out"
