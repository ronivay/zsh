#!/bin/sh

set -eu

source "$ZDIR/zsh-config"

for PLUGIN in ${zsh_plugins[@]}; do
	if ! [ -d $ZDIR/plugins/${PLUGIN##*/} ]; then
		mkdir -p "$ZDIR/plugins"
		git clone "https://github.com/$PLUGIN.git" "$ZDIR/plugins/${PLUGIN##*/}"
	fi
done

if [ ${#zsh_ohmyzsh_plugins[@]} -gt 0 ]; then
	if ! [ -d $ZDIR/plugins/ohmyzsh ]; then
		mkdir -p "$ZDIR/plugins"
		git clone "https://github.com/ohmyzsh/ohmyzsh.git" "$ZDIR/plugins/ohmyzsh"
	fi
fi

if [ -n $zsh_theme ]; then
	if ! [ -d "$ZDIR/themes/${zsh_theme##*/}" ]; then
		git clone "https://github.com/$zsh_theme.git" "$ZDIR/themes/${zsh_theme##*/}"
	fi
}
