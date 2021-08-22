#!/bin/sh

ZDIR=$HOME/.config/zsh

if ! [ -d $ZDIR ]; then
	git clone "https://github.com/ronivay/zsh" $ZDIR
	$ZDIR/prep.sh
fi

cat <<'EOF' >> $HOME/.zshrc
export ZDIR=$HOME/.config/zsh
source $ZDIR/zshrc
EOF

chsh -s $(command -v zsh)

exec zsh
