#!/bin/sh

set -ae

ZDOTDIR=$HOME/.config/zsh

[ ! $(command -v zsh) ] && { echo "install zsh first" ; exit 1; }
[ ! $(command -v git) ] && { echo "install git first" ; exit 1; }

if ! [ -d $ZDOTDIR ]; then
	echo "+++ Cloning https://github.com/ronivay/zsh to $ZDOTDIR"
	echo
	git clone "https://github.com/ronivay/zsh" $ZDOTDIR
	echo "+++ Installing default plugins and theme"
	echo
	zsh $ZDOTDIR/prep.sh
fi

echo
echo "+++ Adding config to ~/.zshrc"
cat <<'EOF' >> $HOME/.zshrc
export ZDOTDIR=$HOME/.config/zsh
source $ZDOTDIR/zshrc
EOF

echo
echo "+++ Changing default shell to zsh"
chsh -s $(command -v zsh)

echo
echo "+++ Done. Restart shell to load"
