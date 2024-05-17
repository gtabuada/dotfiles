# Github Sign Key
export GPG_TTY=$(tty)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
setopt extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gtabuada/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

# Autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# init auto suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ASDF
# init asdf
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Aliases
alias ls='exa --icons'
alias cat='bat --style=auto'
alias vim='nvim'
alias p='pnpm'
alias lg='lazygit'


# pnpm
export PNPM_HOME="/home/gtabuada/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Z
. ~/.zsh/z.sh

# Keychain
eval `keychain --eval --agents ssh --inherit any id_ed25519`

# Supress console output warning
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Home dir shortcut
export WIN_HOME="/mnt/c/Users/ggtbh"
alias @@="cd $WIN_HOME"

# Go bin
export PATH="$PATH:$GOPATH/bin"
alias go-reshim='asdf reshim golang && export GOROOT="$(asdf where golang)/go/"'

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --color=always --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {}' --preview-window=right:60%:wrap --bind '?:toggle-preview'"

# XWindows
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

# Dotfiles Config
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# WSLG - Gui
export DISPLAY=:0

# ADB & Android
export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export ADB_SERVER_SOCKET=tcp:$WSL_HOST:5037
export ANDROID_HOME=~/Android
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
# Java
export JAVA_HOME=/usr/lib/jvm/java-22-openjdk/
export PATH=$PATH:$JAVA_HOME/bin

eval "$(starship init zsh)"
