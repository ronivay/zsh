#!/bin/sh

set -eu

source "$ZDOTDIR/zsh-config"

for PLUGIN in ${zsh_plugins[@]}; do
	if ! [ -d $ZDOTDIR/plugins/${PLUGIN##*/} ]; then
		mkdir -p "$ZDOTDIR/plugins"
		git clone "https://github.com/$PLUGIN.git" "$ZDOTDIR/plugins/${PLUGIN##*/}"
	fi
done

if [ ${#zsh_ohmyzsh_plugins[@]} -gt 0 ]; then
	if ! [ -d $ZDOTDIR/plugins/ohmyzsh ]; then
		mkdir -p "$ZDOTDIR/plugins"
		git clone "https://github.com/ohmyzsh/ohmyzsh.git" "$ZDOTDIR/plugins/ohmyzsh"
	fi
fi

if [ -n $zsh_theme ]; then
	if ! [ -d "$ZDOTDIR/themes/${zsh_theme##*/}" ]; then
		git clone "https://github.com/$zsh_theme.git" "$ZDOTDIR/themes/${zsh_theme##*/}"
	fi
fi
