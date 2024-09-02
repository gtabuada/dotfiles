#!/usr/bin/env bash

languages=$(echo "javascript typescript golang css html" | tr " " "\n")
utils=$(echo "fd asdf grep awk" | tr " " "\n")
selected=$(echo -e "$languages\n$utils" | fzf)
read -p "Type query: " query

if echo $languages | grep -qs $selected; then
  query=$(echo $query | tr " " "+")
  tmux neww bash -c "curl cht.sh/$selected/$query | less -r"
  
else
  tmux neww bash -c "curl cht.sh/$selected~$query | less -r"
fi

