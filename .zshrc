# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# PLUGINS
# powerlevel10k
zi ice depth=1; zi light romkatv/powerlevel10k
# Syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting
# Completions
zinit light zsh-users/zsh-completions
# Autosuggestions
zinit light zsh-users/zsh-autosuggestions
# fzf tab
zinit light Aloxaf/fzf-tab

# SNIPPETS
zinit snippet OMZP::git
zinit snippet OMZP::gcloud
zinit snippet OMZP::archlinux
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::asdf

# Zsh History
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Zsh Misc
setopt extendedglob
unsetopt beep
bindkey -v

# Zsh Autocompletion
zstyle :compinstall filename '/home/gtabuada/.zshrc'
autoload -Uz compinit promptinit
compinit
promptinit
zinit cdreplay -q

# Autocompletion with an arrow-key driven interface
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons=always --color=always $realpath'

# ASDF
# init
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# Aliases
alias ls='eza --color=always --long --git --no-filesize --icons=always --no-time'
alias cd='z'
alias cat='bat --style=auto'
alias vim='nvim'
alias p='pnpm'
alias lg='lazygit'
export WIN_HOME="/mnt/c/Users/ggtbh"
alias @@="cd $WIN_HOME"

# pnpm
export PNPM_HOME="/home/gtabuada/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Z
# . ~/.zsh/z.sh

# GPG TTY
export GPG_TTY=$TTY

# Keychain
eval `keychain --quiet --eval --agents ssh --inherit any id_ed25519`

# Go bin
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
alias go-reshim='asdf reshim golang && export GOROOT="$(asdf where golang)/go/"'

# FZF
export FZF_DEFAULT_COMMAND='fd --color=always --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --style=numbers --color=always {}' --preview-window=right:60%:wrap --bind '?:toggle-preview'"

# Keybinds
bindkey -s '^f' '^u~/dotfiles/scripts/findhome.sh^M'
bindkey -s '^z' '^u~/dotfiles/scripts/cht.sh^M'

# XWindows
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
