# zmodload zsh/zprof

fpath=(${ASDF_DIR}/completions $fpath)
fpath=(~/.zsh $fpath)

# autoload -Uz compinit && compinit

autoload -Uz compinit
# if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
#   compinit;
# else
#   compinit -C;
# fi;

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

autoload -U colors && colors
export ZSH=~/.zsh
export ZSH_CACHE_DIR=$ZSH/cache

HISTSIZE=100000
SAVEHIST=50000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt HIST_FIND_NO_DUPS
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Comment
setopt interactivecomments

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

HISTFILE=~/.zsh_history

source $HOME/.asdf/asdf.sh
source ~/.zsh_plugins.sh
source $HOME/.zsh/zshalias
source $HOME/.zsh/func
# source $HOME/.zsh/keys

# export BAT_THEME="gruvbox-dark"
export BAT_THEME="TwoDark"
export KITTY_CONFIG_DIRECTORY=~/.config/kitty
export VISUAL=nvim
export EDITOR="$VISUAL"
# export PATH=/Users/amanso/.asdf/shims:$PATH

export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS='+c -x'
export FZF_DEFAULT_OPTS="--exact --bind='ctrl-/:toggle-preview' --bind='ctrl-w:toggle-preview-wrap' --preview-window='right:70%:sharp'"

zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

export FORGIT_FZF_DEFAULT_OPTS="
--cycle
--reverse
--height='80%'
--ansi
--preview-window='right:70%:sharp'
--bind='ctrl-/:toggle-preview'
--bind='alt-w:toggle-preview-wrap'
"

export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist noma' -\""
export AUTO_NOTIFY_THRESHOLD=30
export KEYTIMEOUT=1

bindkey -v

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

bindkey -M viins '^[[A' history-substring-search-up
bindkey -M viins '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M viins '^[[1;3C' forward-word
bindkey -M viins '^[[1;3D' backward-word
bindkey -M viins '^[[1;9C' end-of-line
bindkey -M viins '^[[1;9D' beginning-of-line

# JAVA
source ~/.asdf/plugins/java/set-java-home.zsh

# zprof
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^v' edit-command-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# OTR
# eval "$(direnv hook zsh)"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
source ~/.otr
