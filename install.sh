#!/bin/bash

REPOURL="https://github.com/grafburg/vimrc.git"
VIMDIR="$HOME/.config/vim"

# Create the vim directorie's
mkdir -p "$VIMDIR" "$HOME/.vim"

# Navigate to the vim dir, clone this repository and navigate back
cd "$VIMDIR" && git clone "$REPOURL" . && cd -

# Create symlink's
ln -s "$VIMDIR/vimrc" "$HOME/.vimrc"
ln -s "$VIMDIR/coc-settings.json" "$HOME/.vim/coc-settings.json"

# Install node
curl -sL install-node.vercel.app/lts | sudo bash

