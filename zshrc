#!/bin/sh

setopt autocd extendedglob nomatch menucomplete interactive_comments
unsetopt BEEP
autoload -Uz colors && colors

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
 zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
 compinit
_comp_options+=(globdots)

source "$ZDIR/zsh-functions"
source "$ZDIR/zsh-config"

zsh_add_plugins
zsh_add_ohmyzsh_plugins
zsh_add_ohmyzsh_libs
zsh_add_files
zsh_add_theme

# fzf key bindings
# Debian
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
# OSX, fzf from homebrew
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# generic key bindings
# override CTRL-R that comes from fzf.zsh to the one in zsh-navigation-tools
bindkey "^R" znt-history-widget
