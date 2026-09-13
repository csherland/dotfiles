#!/usr/bin/env zsh
# Prompt for a new window or session name inside a tmux popup.
# Usage: rename.sh window|session
# Enter confirms; Esc or Ctrl-c cancels. The current name is pre-filled and editable.
#
# The current name is looked up here rather than passed in: display-popup does not
# expand #{...} in its command string. Inside a popup these resolve to the client's
# current window/session, which is the one the key was pressed in.
# (zsh rather than bash: macOS bash 3.2 has no prefilled `read`.)

set -eu

kind="$1"
case "$kind" in
  window)  name=$(tmux display -p '#W') ;;
  session) name=$(tmux display -p '#S') ;;
  *) exit 1 ;;
esac
current="$name"

bindkey -e                    # emacs line editing regardless of $EDITOR
bindkey '^[' send-break       # lone Esc cancels (arrow keys still work via KEYTIMEOUT)

vared -p "  ${kind} name: " name || exit 0
if [[ -n "$name" && "$name" != "$current" ]]; then
  tmux "rename-$kind" -- "$name"
fi
