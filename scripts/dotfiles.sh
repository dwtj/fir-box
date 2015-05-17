#!/bin/bash -
set -e

DOTFILES_HOME="$HOME/.dotfiles"
DOTFILES_PROJECTS="git interpreters osx terminal vim"

STOW_CMD="/usr/local/bin/stow"

if [[ ! -x "$DOTFILES_HOME" ]]; then
    git clone https://github.com/dwtj/dotfiles.git "$DOTFILES_HOME"
    cd "$DOTFILES_HOME"
    git submodule init
    git submodule update
    $STOW_CMD -R -t ~ $DOTFILES_PROJECTS
    #source ~/.osx
fi
