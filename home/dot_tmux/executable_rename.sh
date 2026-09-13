#!/usr/bin/env zsh
# Prompt for a new window or session name inside a tmux popup.
# Usage: rename.sh window|session <current-name>
# Enter confirms; Esc or Ctrl-c cancels. The current name is pre-filled and editable.
# (zsh rather than bash: macOS bash 3.2 has no prefilled `read`.)

set -eu

kind="$1"
name="${2:-}"
current="$name"

bindkey -e                    # emacs line editing regardless of $EDITOR
bindkey '^[' send-break       # lone Esc cancels (arrow keys still work via KEYTIMEOUT)

vared -p "  ${kind} name: " name || exit 0
if [[ -n "$name" && "$name" != "$current" ]]; then
  tmux "rename-$kind" -- "$name"
fi
