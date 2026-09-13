#!/usr/bin/env bash
# Desktop notification for agent state changes, sent through the outer terminal (Ghostty)
# as an OSC 777 sequence written to the agent pane's tty. Wired up via
# @agent-indicator-notification-command; the plugin provides AGENT_NAME, AGENT_STATE,
# AGENT_SESSION and AGENT_WINDOW, and TMUX_PANE is inherited from the agent process.
# Needs `allow-passthrough all` so tmux forwards it from windows that are not visible.

set -eu

pane="${TMUX_PANE:-}"
[ -n "$pane" ] || exit 0

# Skip when the user is already looking at this window in an attached client
looking=$(tmux display -p -t "$pane" '#{?#{&&:#{window_active},#{session_attached}},1,0}')
[ "$looking" = "1" ] && exit 0

case "${AGENT_STATE:-}" in
  needs-input) body="needs your input" ;;
  done)        body="finished" ;;
  *)           exit 0 ;;
esac

tty=$(tmux display -p -t "$pane" '#{pane_tty}')
printf '\ePtmux;\e\e]777;notify;%s;%s  (%s:%s)\a\e\\' \
  "${AGENT_NAME:-agent}" "$body" "${AGENT_SESSION:-}" "${AGENT_WINDOW:-}" > "$tty"
