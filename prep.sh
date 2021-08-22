#!/bin/sh

set -e

ZDIR="$HOME/.config/zsh"
source "$ZDIR/zsh-plugins"

for PLUGIN in ${zsh_plugins[@]}; do
	if ! [ -d $ZDIR/plugins/${PLUGIN##*/} ]; then
		mkdir -p "$ZDIR/plugins"
		git clone "https://github.com/$PLUGIN.git" "$ZDIR/plugins/${PLUGIN##*/}"
	fi
done

if [ -n $zsh_ohmyzsh_plugins ]; then
	if ! [ -d $ZDIR/plugins/ohmyzsh ]; then
		mkdir -p "$ZDIR/plugins"
		git clone "https://github.com/ohmyzsh/ohmyzsh.git" "$ZDIR/plugins/ohmyzsh"
	fi
fi
