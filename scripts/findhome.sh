#!/usr/bin/env bash

# Grab directories from params; otherwise use pre-set
if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(fd . ~/dev/lyncas ~/dev/jobs ~/dev/sandbox ~/dotfiles ~/dotfiles/.config --type d --exclude .git --exclude node_modules --max-depth 1 --hidden --full-path | fzf)
fi

# If none; clear exit
if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# Try attach to currently running tmux client
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s $selected_name -c $selected
  exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
  tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
