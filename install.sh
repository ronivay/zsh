#!/bin/sh

set -ae

ZDIR=$HOME/.config/zsh

[ ! $(command -v zsh) ] && { echo "install zsh first" ; exit 1; }
[ ! $(command -v git) ] && { echo "install git first" ; exit 1; }

if ! [ -d $ZDIR ]; then
	echo "Cloning https://github.com/ronivay/zsh to $ZDIR"
	git clone "https://github.com/ronivay/zsh" $ZDIR >/dev/null
	echo "Installing default plugins and theme"
	zsh $ZDIR/prep.sh >/dev/null
fi

echo "Adding config to ~/.zshrc"
cat <<'EOF' >> $HOME/.zshrc
export ZDIR=$HOME/.config/zsh
source $ZDIR/zshrc
EOF

echo "Changing default shell to zsh"
chsh -s $(command -v zsh)

echo "Done. Restart shell to load"
