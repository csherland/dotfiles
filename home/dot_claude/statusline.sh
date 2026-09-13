#!/bin/sh
# Claude Code status line — mirrors the starship prompt
# (~/.config/starship.toml, catppuccin mocha palette).
#
# Left segment style: $directory$character  ->  <dir> ➜
# followed by git branch (with dirty marker), model/effort, context-remaining
# percentage, rate-limit usage and an open PR link — all dim/threshold-coloured.
#
# POSIX sh only (no bashisms) — invoked via `bash ~/.claude/statusline.sh`,
# but keep it portable since the shebang is /bin/sh.

input=$(cat)

if ! command -v jq >/dev/null 2>&1; then
  # jq is required to parse the stdin JSON payload.
  printf 'statusline: jq not found in PATH\n'
  exit 0
fi

cwd=$(printf '%s' "$input" | jq -r '.workspace.current_dir // .cwd')
model=$(printf '%s' "$input" | jq -r '.model.display_name // empty')
effort_level=$(printf '%s' "$input" | jq -r '.effort.level // empty')
remaining_pct=$(printf '%s' "$input" | jq -r '.context_window.remaining_percentage // empty')
five_hour_pct=$(printf '%s' "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
seven_day_pct=$(printf '%s' "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
pr_number=$(printf '%s' "$input" | jq -r '.pr.number // empty')
pr_url=$(printf '%s' "$input" | jq -r '.pr.url // empty')
pr_review_state=$(printf '%s' "$input" | jq -r '.pr.review_state // empty')

# Catppuccin mocha (24-bit ANSI), matching home/dot_config/starship.toml
BLUE='\033[38;2;137;180;250m'    # directory
ARROW_GREEN='\033[1;38;2;166;227;161m' # bold ➜ (character.success_symbol)
GREEN='\033[38;2;166;227;161m'   # threshold: good
YELLOW='\033[38;2;249;226;175m'  # threshold: warn
RED='\033[38;2;243;139;168m'     # threshold: bad / dirty marker
MAUVE='\033[38;2;203;166;247m'   # git branch
SAPPHIRE='\033[38;2;116;199;236m' # PR link
DIM='\033[38;2;108;112;134m'     # overlay0 - dim labels
RESET='\033[0m'

# round_num N -> nearest integer (handles floats from the JSON payload)
round_num() {
  awk -v p="$1" 'BEGIN { printf "%.0f", p }'
}

# color_by_remaining N -> "green"/"yellow"/"red" for a "% remaining" value
# (higher is better: >=50 good, 20-49 warn, <20 bad)
color_by_remaining() {
  awk -v p="$1" 'BEGIN {
    if (p >= 50) print "green"
    else if (p >= 20) print "yellow"
    else print "red"
  }'
}

# color_by_used N -> "green"/"yellow"/"red" for a "% used" value
# (lower is better: <50 good, 50-79 warn, >=80 bad)
color_by_used() {
  awk -v p="$1" 'BEGIN {
    if (p < 50) print "green"
    else if (p < 80) print "yellow"
    else print "red"
  }'
}

# color_for TAG -> the matching color escape var
color_for() {
  case "$1" in
    green) printf '%s' "$GREEN" ;;
    yellow) printf '%s' "$YELLOW" ;;
    *) printf '%s' "$RED" ;;
  esac
}

# Collapse $HOME to ~ before truncating
case "$cwd" in
  "$HOME") dir="~" ;;
  "$HOME"/*) dir="~${cwd#"$HOME"}" ;;
  *) dir="$cwd" ;;
esac

# Truncate to the last 3 trailing path components (like starship's
# default directory.truncation_length), prefixing with "..." when cut.
dir=$(printf '%s' "$dir" | awk -F'/' '{
  n = NF
  if (n <= 3) { print; exit }
  out = ""
  for (i = n - 2; i <= n; i++) out = out "/" $i
  print "..." out
}')

# Git branch + dirty marker, skipping optional locks
branch=""
dirty=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null \
    || git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  if [ -n "$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)" ]; then
    dirty="${RED} *${RESET}"
  fi
fi

line="${BLUE}${dir}${RESET} ${ARROW_GREEN}➜${RESET}"

if [ -n "$branch" ]; then
  line="${line} ${MAUVE} ${branch}${RESET}${dirty}"
fi

# Model (+ effort level), dim
if [ -n "$model" ]; then
  line="${line} ${DIM}${model}"
  if [ -n "$effort_level" ]; then
    line="${line} (${effort_level})"
  fi
  line="${line}${RESET}"
fi

# Context remaining, threshold-coloured; "·" separator stays dim
if [ -n "$remaining_pct" ]; then
  tag=$(color_by_remaining "$remaining_pct")
  col=$(color_for "$tag")
  disp=$(round_num "$remaining_pct")
  line="${line} ${DIM}·${RESET} ${col}${disp}% left${RESET}"
fi

# Rate limits (5h / 7d), label dim + number threshold-coloured (inverted:
# lower usage is better)
if [ -n "$five_hour_pct" ]; then
  tag=$(color_by_used "$five_hour_pct")
  col=$(color_for "$tag")
  disp=$(round_num "$five_hour_pct")
  line="${line} ${DIM}5h ${RESET}${col}${disp}%${RESET}"
fi

if [ -n "$seven_day_pct" ]; then
  tag=$(color_by_used "$seven_day_pct")
  col=$(color_for "$tag")
  disp=$(round_num "$seven_day_pct")
  line="${line} ${DIM}7d ${RESET}${col}${disp}%${RESET}"
fi

# Open PR, sapphire, wrapped in an OSC 8 hyperlink when a URL is present;
# small review-state marker (✓ approved / ✗ changes requested).
if [ -n "$pr_number" ]; then
  if [ -n "$pr_url" ]; then
    pr_text='\033]8;;'"${pr_url}"'\033\\#'"${pr_number}"'\033]8;;\033\\'
  else
    pr_text="#${pr_number}"
  fi

  marker=""
  case "$pr_review_state" in
    approved) marker="${GREEN} ✓${RESET}" ;;
    changes_requested) marker="${RED} ✗${RESET}" ;;
  esac

  line="${line} ${SAPPHIRE}${pr_text}${RESET}${marker}"
fi

printf '%b\n' "$line"
