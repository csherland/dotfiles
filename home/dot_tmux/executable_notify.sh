#!/usr/bin/env bash
# Desktop notification for agent state changes, wired up via
# @agent-indicator-notification-command. The plugin provides AGENT_NAME, AGENT_STATE,
# AGENT_SESSION and AGENT_WINDOW; TMUX_PANE is inherited from the agent process.
#
# Delivery is via osascript rather than Ghostty's OSC 777 escape: the escape reaches
# Ghostty correctly but produces no banner on this machine, while osascript works. The
# tradeoff is that banners are attributed to Script Editor and are not click-to-focus.
# If Ghostty is later granted notification permission in System Settings, the escape in
# ghostty_notify() below can be used instead (and Claude Code's own notifications, which
# take that same route, would start working too).

set -eu

pane="${TMUX_PANE:-}"
[ -n "$pane" ] || exit 0

# Skip when the user is already looking at this window in an attached client
looking=$(tmux display -p -t "$pane" '#{?#{&&:#{window_active},#{session_attached}},1,0}' 2>/dev/null || echo 0)
[ "$looking" = "1" ] && exit 0

case "${AGENT_STATE:-}" in
  needs-input) body="needs your input" ;;
  done)        body="finished" ;;
  *)           exit 0 ;;
esac

title="${AGENT_NAME:-agent}"
where="${AGENT_SESSION:-}:${AGENT_WINDOW:-}"

ghostty_notify() {  # unused; see the note above
  local tty; tty=$(tmux display -p -t "$pane" '#{pane_tty}')
  printf '\ePtmux;\e\e]777;notify;%s;%s  (%s)\a\e\\' "$title" "$body" "$where" > "$tty"
}

esc() { printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'; }

osascript -e "display notification \"$(esc "$body")  ($(esc "$where"))\" with title \"$(esc "$title")\" sound name \"Glass\"" >/dev/null 2>&1 || true
