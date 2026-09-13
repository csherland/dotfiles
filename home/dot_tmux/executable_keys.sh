#!/usr/bin/env bash
# Key palette: fuzzy-search all prefix bindings that carry a -N note, run the chosen one.
# Usage: keys.sh <client-name>   (bound to prefix + ? via display-popup)

set -eu

client="$1"
prefix=$(tmux show -gv prefix)

selected=$(tmux list-keys -N -T prefix \
  | fzf --reverse --with-nth 2.. --no-info \
        --prompt "  ${prefix} " \
        --header "Enter runs the binding · Esc closes" \
        --color "header:dim") || exit 0

key=$(awk '{print $2}' <<<"$selected")

# Replay prefix + key to the client after this popup has closed; running it from inside
# the popup would fail for bindings that open their own popup (rename, sesh).
tmux run-shell -b "sleep 0.15; tmux send-keys -K -c '$client' '$prefix' $(printf %q "$key")"
