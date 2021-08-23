#!/bin/zsh

set -ae

ZDIR=$HOME/.config/zsh

[ ! $(command -v zsh) ] && { echo "install zsh first" ; exit 1; }
[ ! $(command -v git) ] && { echo "install git first" ; exit 1; }

if ! [ -d $ZDIR ]; then
	echo "+++ Cloning https://github.com/ronivay/zsh to $ZDIR"
	echo
	git clone "https://github.com/ronivay/zsh" $ZDIR
	echo "+++ Installing default plugins and theme"
	echo
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
	fi
else
	echo "$ZDIR already exists, not continuing"
	exit 1
fi

echo
echo "+++ Adding config to ~/.zshrc"
cat <<'EOF' >> $HOME/.zshrc
export ZDIR=$HOME/.config/zsh
source $ZDIR/zshrc
EOF

echo
echo "+++ Changing default shell to zsh"
chsh -s $(command -v zsh)

echo
echo "+++ Done. Restart shell to load"
