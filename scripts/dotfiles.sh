#!/bin/bash -

DOTFILES_HOME="$HOME/.dotfiles"
DOTFILES_PROJECTS="git interpreters terminal vim"

if [[ ! -x "$DOTFILES_HOME" ]]; then
    git clone https://github.com/dwtj/dotfiles.git "$DOTFILES_HOME"
    cd "$DOTFILES_HOME"
    git submodule init
    git submodule update
    stow -R -t ~ $DOTFILES_PROJECTS
fi
