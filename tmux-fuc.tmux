#!/usr/bin/env bash

get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value=$(tmux show-option -gqv "$option")

  if [[ -z $option_value ]]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

readonly fuc_key="$(get_tmux_option "@fuc-key" "e")"
readonly fuc_path="$(get_tmux_option "@fuc-path" "${HOME}/.fuc")"

fuc_copy="$(get_tmux_option "@fuc-copy-command" "")"
test -x "$(command -v xclip)" &&
  fuc_copy='DISPLAY=:0 xclip -sel clipboard -i' || fuc_copy='pbcopy -'

# For some reason xclip does not like being last. Added sleep.
tmux bind-key "$fuc_key" \
  split-window -l 10 "grep -hE '^\\$' ${fuc_path}/*.md | sed 's/^\\$ //' | peco | tr -d '\\n' | $fuc_copy; sleep 0.1"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
