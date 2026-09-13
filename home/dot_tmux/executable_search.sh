#!/usr/bin/env bash
# Fuzzy-search this pane's scrollback in a popup, then jump to the chosen line in copy mode.
# Usage: search.sh   (bound to prefix + / via display-popup)
#
# display-popup does not expand #{...} in its command, so the pane is resolved here
# instead of being passed in; inside a popup this resolves to the client's current pane.
#
# goto-line is unreliable here (it clamps to the history size), so the jump is done by
# moving to the top of the scrollback and stepping down by the captured line number.

set -eu

pane=$(tmux display -p '#{pane_id}')
tmpfile=$(mktemp "${TMPDIR:-/tmp}/tmux-search.XXXXXX")
trap 'rm -f "$tmpfile"' EXIT

tmux capture-pane -p -J -S - -t "$pane" > "$tmpfile"

selected=$(grep -n . "$tmpfile" | fzf \
  --delimiter ':' --with-nth '2..' \
  --tac --no-sort --reverse --no-info \
  --prompt '  ' \
  --header 'Enter jumps to the line in copy mode · Esc cancels' \
  --color 'header:dim' \
  --preview "awk -v n=\"{1}\" 'NR>=n-6 && NR<=n+6 { printf \"%s%s\n\", (NR==n ? \"> \" : \"  \"), \$0 }' $tmpfile" \
  --preview-window 'down:40%') || exit 0

line=${selected%%:*}
[ -n "$line" ] || exit 0

tmux copy-mode -t "$pane"
tmux send-keys -t "$pane" -X history-top
[ "$line" -gt 1 ] && tmux send-keys -t "$pane" -N "$((line - 1))" -X cursor-down
exit 0
