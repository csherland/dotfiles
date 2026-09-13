#!/usr/bin/env bash
# Persistent "this window wants you" marker for agent windows.
#
# Called from Claude Code hooks with a state, alongside tmux-agent-indicator (which
# colours the tab). This sets a per-window option that window-status-format renders as
# a dot, so the marker survives until you actually visit the window.
#
#   agent_attention.sh needs-input|done|clear [window-id]
#
# With no window id it uses the window of $TMUX_PANE (set for any process in a pane).

set -eu

state="${1:-clear}"
window="${2:-}"

if [ -z "$window" ]; then
  [ -n "${TMUX_PANE:-}" ] || exit 0
  window=$(tmux display -t "$TMUX_PANE" -p '#{window_id}' 2>/dev/null) || exit 0
fi

case "$state" in
  needs-input|done)
    # Never mark the window the user is already looking at
    looking=$(tmux display -t "$window" -p '#{?#{&&:#{window_active},#{session_attached}},1,0}' 2>/dev/null || echo 0)
    [ "$looking" = "1" ] && exit 0
    tmux set-window-option -t "$window" @agent_attention "$state"
    ;;
  *)
    tmux set-window-option -qt "$window" -u @agent_attention 2>/dev/null || true
    ;;
esac
